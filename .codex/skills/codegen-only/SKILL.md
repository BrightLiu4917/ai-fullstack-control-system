---
name: codegen-only
description: 兼容入口。CRUD、脚手架、Controller、Service、Mapper/XML、DTO/VO 生成任务必须改用 codegen-java-springboot-crud。禁止手工生成标准 CRUD。
---

# Codegen Only

本 skill 仅保留为兼容入口。

## 必须改用
- `codegen-java-springboot-crud`

## 强制规则
- 标准 CRUD 禁止手工生成。
- 必须使用仓库内置脚本：
  - `tools/codegen/java-springboot-crud/scripts/crud-spring-bootv2`
  - `tools/codegen/java-springboot-crud/scripts/crud-spring-bootv34`
- 必须 preview first。
- 覆盖已有文件必须等待用户确认。
