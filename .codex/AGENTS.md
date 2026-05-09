# Codex 局部契约

本文件与项目根目录 `AGENTS.md` 保持同一职责：定义安全红线、OpenSpec-first 工作流和 skill 路由。

如本文件与根 `AGENTS.md` 冲突，以根 `AGENTS.md` 为准，并立即提示用户同步。

必须遵守：
- 非简单任务先进入 OpenSpec。
- 不清楚就 STOP and ASK。
- 不猜业务、字段、枚举、权限、租户、API、UI 交互。
- 涉及数据库先走 `mysql-dba`。
- 标准 CRUD 走 `codegen-only`。
- 交付前走 `reviewer`。
