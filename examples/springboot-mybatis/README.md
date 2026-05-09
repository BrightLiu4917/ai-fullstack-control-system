# Spring Boot + MyBatis 示例

建议把本控制系统复制到项目根目录：

```text
your-project/
├── AGENTS.md
├── openspec/
├── docs/
├── .codex/
├── scripts/
├── tools/
├── pom.xml
└── src/
```

后端任务默认流程：

```text
openspec-grill -> db-mysql-dba -> api-contract-review -> codegen-java-springboot-crud/backend-java-springboot -> springboot-tdd -> review-production
```
