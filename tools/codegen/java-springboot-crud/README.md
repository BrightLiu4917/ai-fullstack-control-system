# Java Spring Boot CRUD Codegen

本目录内置当前批准使用的 Spring Boot + MyBatis CRUD 脚手架生成器。

## Scripts

```text
scripts/crud-spring-bootv2
scripts/crud-spring-bootv34
```

选择规则：
- Spring Boot 2.x 使用 `crud-spring-bootv2`
- Spring Boot 3.x / 4.x 使用 `crud-spring-bootv34`

## 使用原则

- 必须先 `--preview`
- 无法从 `pom.xml` 判断 Spring Boot 版本时必须询问
- 覆盖已有文件必须等待 force token 和用户确认
- 禁止手工生成标准 CRUD 脚手架
- 禁止用其他生成方式替代，除非用户明确批准
