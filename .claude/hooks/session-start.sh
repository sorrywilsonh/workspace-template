#!/bin/bash
# 只在 Claude Code on the web(remote)環境跑;本機已經有 ~/.claude/skills 全域可用,不需要這支 hook。
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# 只有全新啟動(source=startup)才需要重抓;resume/clear/compact 是同一個容器,
# 檔案系統早就在了,重跑一次 clone 只是浪費時間。
INPUT="$(cat)"
SOURCE="$(printf '%s' "$INPUT" | grep -o '"source"[[:space:]]*:[[:space:]]*"[a-z]*"' | grep -o '"[a-z]*"$' | tr -d '"')"
if [ "$SOURCE" != "startup" ]; then
  exit 0
fi

set -uo pipefail

REPO_URL="https://github.com/sorrywilsonh/claude-skills"
TMP="$(mktemp -d)"

if ! git clone --depth 1 -q "$REPO_URL" "$TMP" 2>/dev/null; then
  echo "warn: 無法抓取 claude-skills(repo 是否還是 private?),略過共用 skill,這次 session 只有本專案自己的 skill 可用"
  rm -rf "$TMP"
  exit 0
fi

mkdir -p "$CLAUDE_PROJECT_DIR/.claude/skills"
# 用 cp -a 合併(不用 rsync,容器內不一定有裝):只把共用 skill 疊加進來,
# 不會刪掉這個專案自己在 .claude/skills/ 裡已有的內容,同名資料夾才會被覆蓋。
cp -a "$TMP/.claude/skills/." "$CLAUDE_PROJECT_DIR/.claude/skills/"
rm -rf "$TMP"

echo "已從 claude-skills 載入共用 skill 到 $CLAUDE_PROJECT_DIR/.claude/skills/"
