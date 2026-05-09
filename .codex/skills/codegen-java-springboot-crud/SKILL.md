---
name: codegen-java-springboot-crud
description: 使用仓库内置 Java Spring Boot + MyBatis CRUD 生成器生成标准 CRUD 脚手架。Spring Boot 2.x 使用 tools/codegen/java-springboot-crud/scripts/crud-spring-bootv2，Spring Boot 3.x/4.x 使用 crud-spring-bootv34。用于 CRUD、Controller、Service、Mapper/XML、DTO/VO 批量生成，必须 preview first，禁止手工生成。
---

# Java Spring Boot CRUD Codegen

## 适用场景
- 生成标准 CRUD、管理端基础接口、Mapper/XML、DTO/VO、Service、Controller 脚手架。
- 用户明确要求脚手架、生成器、codegen、crud-codegen。
- 需要批量生成重复结构，且手工实现容易偏离项目约定。

## 必须读取
- `AGENTS.md`
- `docs/SPRING_BOOT_RULES.md`
- `docs/API_RULES.md`
- `docs/DB_SCHEMA_RULES.md`
- `tools/codegen/java-springboot-crud/README.md`

## 脚本路径
优先使用目标项目内置脚本：

```bash
bash tools/codegen/java-springboot-crud/scripts/crud-spring-bootv2
bash tools/codegen/java-springboot-crud/scripts/crud-spring-bootv34
```

如果本控制系统尚未复制到目标项目，但当前仓库存在该脚本，可使用本仓库绝对路径作为后备，并在输出中明确说明。

禁止默认依赖 `~/.codex/skills/...` 路径，除非目标项目内没有内置脚本且用户确认使用本机全局脚本。

## 版本选择
- Spring Boot 2.x 使用 `crud-spring-bootv2`。
- Spring Boot 3.x 或 4.x 使用 `crud-spring-bootv34`。
- 必须从 `pom.xml` 判断版本。
- 无法判断版本时，必须询问用户，禁止猜测。

## 执行流程
1. 定位项目根目录和目标模块路径。
2. 从 `pom.xml` 判断 Spring Boot 版本，并记录判断依据。
3. 选择对应脚本。
4. 调用脚本查看用法，或按用户参数组装命令。
5. 必须优先使用 `--preview`。
6. 核对必要参数：`--project-root`、`--entity-name`、`--module-path`、`--route-path`、`--display-name`、`--ddl`。
7. 可选参数按项目需要提供：`--base-package`、`--java-base-dir`、`--resources-base-dir`、`--table-name`、各类 `*-path`。
8. 如果预览显示目标文件已存在，必须等待脚本给出的 `--force-token`，并让用户确认后再执行覆盖。
9. 不手工修补生成结果；如果不符合需求，应调整参数后重新预览或重新生成。
10. 如果多次生成仍失败，停止并报告具体错误，请求调整输入参数。

## 停止并询问
- 脚本不存在或无法执行。
- 无法确认 Spring Boot 版本。
- 必要参数缺失。
- 表字段、主键、租户字段、软删除字段、状态字段或接口路径不明确。
- 需要覆盖已有文件但用户未确认。
- 用户要求手工实现标准 CRUD 文件。

## 禁止
- 禁止手工生成 Controller/Service/Mapper/XML 标准 CRUD。
- 禁止分析或修改既有 Java 文件来替代脚本生成。
- 禁止猜测表字段。
- 禁止绕过生成器冲突检查。
- 禁止为了让生成结果通过而修改无关业务代码。

## 输出要求
- 使用脚本完整路径。
- Spring Boot 版本和判断依据。
- 关键参数。
- preview 结果。
- force-token 和用户确认状态，如有。
- 计划生成、修改、覆盖的文件。
- 实际变更文件。
- 验证步骤。
- 假设和风险。
