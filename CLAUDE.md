# Workspace 總覽

<!-- TODO: 換成這個 repo 實際的用途說明,例如:「這是 XX 部門的工作用 workspace,用來存放不同資訊系統的說明文件、程式碼、筆記與流程圖」 -->
這個 repo 是一個工作用 workspace,用來存放不同資訊系統的說明文件、程式碼、筆記與流程圖,並在同一個 workspace 裡產生文件/簡報、回答系統相關問題、撰寫與修改程式。

## 目前有哪些系統

<!-- TODO: 每加一個系統,在這裡補一行,格式:`systems/<name>/` — 一句話說明用途 -->
(尚無系統)

新增系統時,在這裡補一行,並在 `systems/` 底下建立同樣結構的子資料夾(`CLAUDE.md` / `src/` / `docs/` / `output/`)。

## 共用規範

- 程式撰寫規範:`standards/code-style-guide.md`
<!-- TODO: 補充公司模板實際放在哪,或說明尚未提供 -->
- 文件/簡報規範與公司模板:待補充到 `standards/`(目前尚未提供公司模板檔案)

## 個人通用 Skill(跟這個 workspace 無關)

跟工作內容無關、任何專案都能用的通用 skill(pptx、docx 等)**不放在這個 repo 裡**,
集中維護在獨立的 [`claude-skills`](https://github.com/sorrywilsonh/claude-skills) repo,
同步進本機 `~/.claude/skills/`(`sync.sh` 推上雲端、`pull.sh` 拉回本機)。

之後這個 workspace 若要新增「只給這個工作專用」的 skill,放在這個 repo 自己的
`.claude/skills/` 底下,跟上面的個人通用 skill 分開存放。

**Web(claude.ai/code)沒有本機的 `~/.claude/skills/`,所以另外靠 `.claude/hooks/session-start.sh`
這支 SessionStart hook,在每次全新 session 啟動時把 `claude-skills`(public repo)的內容抓進來、
疊加進這個 repo 的 `.claude/skills/`(不會覆蓋這個 repo 自己的 skill)。只在 `source=startup` 時執行,
resume/clear/compact 不會重跑。本機不受影響,個人層級 skill 一直都自動生效。**

## 系統間關聯

見 `systems/_relationships.md`。

## 分支與 Session 使用習慣

**黃金原則:分支是通道,不是倉庫。** 任何分支存在的時間都應該短暫,只有兩種合法結局:
- 東西有價值 → 開 PR(或直接 merge)併回 `main` → 併完立刻刪掉分支
- 東西不需要留 → 直接刪掉分支,不要放著不管

**開新 session 前先問:** 這是要繼續這個 workspace 的正式內容,還是單純想試試看?是後者就不要在這個 repo 開 session——另外找 sandbox/scratch repo,或開不綁 repo 的 session,不要讓實驗性質的東西進到這裡的分支清單。

**Session 做完當下立刻收尾,不要拖。** 覺得可以告一段落,當場決定「併回去刪分支」或「直接刪分支」,不要留到之後——時間一拉長,連自己都會忘記那條分支是為了什麼開的。

**定期健檢:** 偶爾看一眼這個 repo 的 branches 頁面。健康狀態應該是除了 `main` 幾乎沒有其他分支,或只有 1-2 條正在進行中的。看到一堆叫不出名字的分支,就是該停下來處理的訊號。

**結構或流程有變動,隨手更新這份 CLAUDE.md**——這是讓下一次全新 session 一進來就能重建完整脈絡的關鍵,不要只依賴 commit log。

## 一般規則

- 修改任何 `systems/*/src/` 底下的程式碼前,先說明改動內容並取得確認
- 產生的文件或簡報依 `standards/` 裡的規範與模板為準
- 找不到答案時如實說明「文件中未提及」,不要用常識臆測系統實際行為
