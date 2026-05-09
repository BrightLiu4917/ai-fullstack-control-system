---
name: mysql-dba
description: 兼容入口。MySQL 表结构、字段、索引、迁移、回滚、SQL 安全和生产数据风险任务必须改用 db-mysql-dba。
---

# MySQL DBA Compatibility

本 skill 仅保留为兼容入口。

## 必须改用
- `db-mysql-dba`

## 强制规则
- 涉及 DB/SQL/索引/迁移/回滚/高风险数据操作，必须先走 `db-mysql-dba`。
- 未确认前禁止执行 CREATE、UPDATE、DELETE、ALTER、DROP、TRUNCATE。
