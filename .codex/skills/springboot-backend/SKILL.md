---
name: springboot-backend
description: 兼容入口。Java Spring Boot 后端接口、Service、Mapper/XML、DTO/VO、事务和业务实现任务必须改用 backend-java-springboot。
---

# Spring Boot Backend Compatibility

本 skill 仅保留为兼容入口。

## 必须改用
- `backend-java-springboot`

## 强制规则
- 标准 CRUD 改用 `codegen-java-springboot-crud`。
- 涉及数据库先走 `db-mysql-dba`。
- 涉及 API 契约先走 `api-contract-review`。
