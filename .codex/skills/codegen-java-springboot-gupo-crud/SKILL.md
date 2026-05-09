---
name: codegen-java-springboot-gupo-crud
description: gupo 项目专用 Java Spring Boot + MyBatis CRUD adapter。仅适用于 gupo 封装、包结构、返回体、分页、异常、DTO/VO、Mapper/XML 和接口约定；必须 preview first，禁止用于非 gupo 项目。
---

# gupo Java Spring Boot CRUD 代码生成

## 适用场景
- 用户明确说明目标项目是 gupo 项目。
- `.codex/codegen.toml` 明确声明 `adapter = "gupo"`。
- 项目指纹高置信命中 gupo 约定，并经用户确认可使用 gupo adapter。

## 必须读取
- `AGENTS.md`
- `docs/SPRING_BOOT_RULES.md`
- `docs/API_RULES.md`
- `docs/DB_SCHEMA_RULES.md`
- `tools/codegen/java-springboot-crud-adapters/README.md`
- `tools/codegen/java-springboot-crud-adapters/gupo/README.md`
- `tools/codegen/java-springboot-crud-adapters/gupo/adapter.toml`

## 脚本路径
优先使用目标项目内置脚本：

```bash
bash tools/codegen/java-springboot-crud-adapters/gupo/scripts/crud-spring-bootv2
bash tools/codegen/java-springboot-crud-adapters/gupo/scripts/crud-spring-bootv34
```

如果本控制系统尚未复制到目标项目，但当前仓库存在该脚本，可使用本仓库绝对路径作为后备，并在输出中明确说明。

## 版本选择
- Spring Boot 2.x 使用 `crud-spring-bootv2`。
- Spring Boot 3.x 或 4.x 使用 `crud-spring-bootv34`。
- 必须从 `pom.xml` 判断 Spring Boot 版本。
- 无法判断版本时，必须询问用户，禁止猜测。

## 执行流程
1. 确认 adapter 为 `gupo`，并记录确认依据。
2. 定位项目根目录和目标模块路径。
3. 从 `pom.xml` 判断 Spring Boot 版本，并记录判断依据。
4. 选择对应脚本。
5. 调用脚本查看用法，或按用户参数组装命令。
6. 必须优先使用 `--preview`。
7. 核对必要参数：`--project-root`、`--entity-name`、`--module-path`、`--route-path`、`--display-name`、`--ddl`。
8. 可选参数按 gupo 项目需要提供：`--base-package`、`--java-base-dir`、`--resources-base-dir`、`--table-name`、各类 `*-path`。
9. 如果预览显示目标文件已存在，必须等待脚本给出的 `--force-token`，并让用户确认后再执行覆盖。
10. 不手工修补生成结果；如果不符合需求，应调整参数后重新预览或重新生成。

## 停止并询问
- adapter 未确认是 gupo。
- 脚本不存在或无法执行。
- 无法确认 Spring Boot 版本。
- 必要参数缺失。
- 表字段、主键、租户字段、软删除字段、状态字段或接口路径不明确。
- 需要覆盖已有文件但用户未确认。
- 用户要求把 gupo 脚手架用于非 gupo 项目。

## 禁止
- 禁止用于非 gupo 项目。
- 禁止伪装为通用 Java Spring Boot CRUD 脚手架。
- 禁止手工生成 Controller/Service/Mapper/XML 标准 CRUD。
- 禁止猜测表字段。
- 禁止绕过生成器冲突检查。
- 禁止为了让生成结果通过而修改无关业务代码。

## 输出要求
- 使用的 adapter：`gupo`。
- adapter 确认依据。
- 使用脚本完整路径。
- Spring Boot 版本和判断依据。
- 关键参数。
- preview 结果。
- force-token 和用户确认状态，如有。
- 计划生成、修改、覆盖的文件。
- 实际变更文件。
- 验证步骤。
- 假设和风险。
