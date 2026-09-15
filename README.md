# workspace-template

多資訊系統工作 workspace 的起始模板。用 GitHub 的 **Use this template** 建立新專案,就會複製這整套架構(不含 git 歷史),照著 `CLAUDE.md` 裡的 TODO 填上這個新專案的實際內容即可。

## 用法

1. 這個 repo 要先設定成 Template repository:Settings → General → 勾選 **Template repository**
2. 之後要開新工作專案:GitHub 上點這個 repo 的 **Use this template** → **Create a new repository**
3. 進新 repo,把 `CLAUDE.md` 裡標 `<!-- TODO -->` 的地方填好(專案用途、有哪些系統)
4. 有實際程式碼要放時,在 `systems/` 底下建立 `<system-name>/`,結構比照:
   ```
   systems/<system-name>/
   ├── CLAUDE.md      ← 這個系統的背景、規則
   ├── src/           ← 程式碼
   ├── docs/          ← 說明文件、筆記、流程圖
   └── output/        ← 執行產出
   ```
5. 有跨系統關聯時更新 `systems/_relationships.md`

## 已經內建的東西

- `.claude/hooks/session-start.sh` + `.claude/settings.json` — web session 啟動時自動把 [`claude-skills`](https://github.com/sorrywilsonh/claude-skills) 的共用 skill 疊加進這個專案的 `.claude/skills/`,不用改,直接生效
- 分支與 Session 使用習慣(見 `CLAUDE.md` 對應章節)— 沿用同一套習慣,保持每個新專案的 repo 乾淨

## 既有專案(已經有程式碼)怎麼套用這套架構

Template 只在**建立新 repo** 那一刻有用,既有 repo 沒辦法事後套用。這種情況要手動搬：複製這裡的 `.claude/`、`CLAUDE.md` 的通用段落、`standards/`,再把既有程式碼搬進 `systems/<name>/src/`,寫一份系統專屬的 `CLAUDE.md`——比照 [`TWSE_projects`](https://github.com/sorrywilsonh/TWSE_projects) repo 實際做過的方式。
