# Skill 命名规则

## 目标
支持多个后端语言、前端框架、数据库和代码生成器并存，避免 skill 名称含糊或职责重叠。

## 命名格式

```text
<domain>-<language/framework/tool>-<purpose>
```

常用前缀：

```text
product-*
business-*
ux-*
ui-*
frontend-<framework>-*
backend-<language>-<framework>
db-<engine>-*
codegen-<language>-<framework>-*
test-<scope>-*
review-*
security-*
performance-*
release-*
```

## 当前生产级主入口

```text
codegen-java-springboot-crud
db-mysql-dba
backend-java-springboot
review-production
```

## 兼容入口

以下旧名称只用于兼容，不作为新增能力主入口：

```text
codegen-only -> codegen-java-springboot-crud
mysql-dba -> db-mysql-dba
springboot-backend -> backend-java-springboot
reviewer -> review-production
```

## 后续扩展示例

```text
backend-node-nestjs
backend-python-fastapi
frontend-react-admin
frontend-vue-admin
db-postgres-dba
codegen-node-nestjs-crud
codegen-python-fastapi-crud
```

## 禁止
- 禁止新增含义宽泛的 `backend`、`frontend`、`codegen`、`review` 作为主 skill。
- 禁止让一个 skill 同时负责多个语言或多个框架的实现细节。
- 禁止复制旧 skill 后只改名字但不改 description。
