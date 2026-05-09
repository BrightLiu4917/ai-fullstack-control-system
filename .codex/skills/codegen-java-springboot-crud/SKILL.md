---
name: codegen-java-springboot-crud
description: Java Spring Boot CRUD 脚手架 adapter 路由入口。用于先识别目标项目适配器；没有可用 adapter 时不得生成脚手架，可在用户确认后转入 backend-java-springboot 做生产级手写实现。
---

# Java Spring Boot CRUD Adapter 路由

## 适用场景
- 用户要求 Java Spring Boot CRUD 脚手架、生成器、codegen 或批量生成 Controller/Service/Mapper/XML/DTO/VO。
- 需要先判断目标项目是否已有已确认 codegen adapter。
- 用户没有明确指定 gupo 或其他 adapter。
- generic adapter 不可用，需要判断是否转入生产级手写实现。

## 必须读取
- `AGENTS.md`
- `docs/SKILL_ROUTING.md`
- `docs/SKILL_NAMING_RULES.md`
- `tools/codegen/java-springboot-crud-adapters/README.md`
- 目标项目 `.codex/codegen.toml`，如存在。

## 判定顺序
1. 用户显式指定 adapter，例如 `gupo`。
2. 目标项目 `.codex/codegen.toml` 声明 adapter。
3. 安装 profile 或 adapter registry 声明目标项目使用某 adapter。
4. 项目指纹高置信命中某 adapter。
5. 仍无法确认时停止询问。

## 当前可用 adapter
- `gupo` -> `codegen-java-springboot-gupo-crud`

## gupo 高置信指纹
只有同时命中多项强特征时，才可建议 gupo adapter：
- `pom.xml` 的 groupId、artifactId 或包名包含 gupo/groupds 约定。
- 存在 gupo 项目的响应封装、分页封装、异常体系或基础 Controller/Service。
- 既有目录符合 gupo 约定，例如 `entity/req`、`entity/vo`、`entity/model`。
- 既有 Mapper/XML、DTO/VO、接口路径使用 gupo 固定封装和命名。

Spring Boot、MyBatis 或 MyBatis-Plus 本身不是选择 gupo adapter 的充分条件。

## 执行流程
1. 定位目标项目根目录。
2. 读取 `.codex/codegen.toml`，如存在。
3. 读取 `pom.xml` 和少量既有代码目录，只用于 adapter 指纹识别。
4. 如果确认是 gupo，改用 `codegen-java-springboot-gupo-crud`。
5. 如果用户要求通用 Java Spring Boot CRUD，说明当前 generic adapter 尚未实现。
6. 询问用户是否允许转入 `backend-java-springboot` 进行生产级手写实现。
7. 如用户确认手写，先确保 OpenSpec、API contract、DBA、测试和审查路径齐全。
8. 如果 adapter、字段、契约、权限、租户或业务规则不清，停止询问。

## 停止并询问
- 目标项目没有明确 adapter。
- 项目指纹不足以识别 gupo。
- 用户要求非 gupo 项目生成脚手架。
- 用户要求使用“通用”脚手架，但 generic adapter 尚未实现且未确认手写实现。
- 用户要求手写实现，但字段、API、权限、租户、状态流转或数据库规则不清。

## 禁止
- 禁止把 gupo 脚手架当成通用 Spring Boot 脚手架。
- 禁止仅凭 Spring Boot/MyBatis/MyBatis-Plus 判断为 gupo。
- 禁止在没有 adapter 的项目中试生成。
- 禁止用低质量模板拼接 Controller/Service/Mapper/XML。
- 禁止伪实现、空方法、TODO 实现或发明项目抽象。
- 禁止在未确认规则时转入手写实现。

## 输出要求
- adapter 判定依据。
- 命中的项目指纹或显式配置。
- 若选择 gupo，说明将转入 `codegen-java-springboot-gupo-crud`。
- 若 generic adapter 不可用，说明是否转入 `backend-java-springboot` 手写实现。
- 若无法选择 adapter 且无法手写，列出需要用户确认的问题。
- 不产生代码时明确说明未修改文件。
