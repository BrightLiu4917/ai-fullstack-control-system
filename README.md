# AI 全栈控制系统

一套可复制到业务项目中的 AI 全栈工程控制系统（AI Fullstack Control System）。

目标不是让 AI 自由发挥，而是把产品、业务、设计、前端、后端、数据库、测试、审查和发布串成可确认、可审查、可回滚的工程流程。

本仓库融合两类思想：

- OpenSpec：作为产品、业务、规格、设计、任务和归档的事实源。
- Matt Pocock skills：作为工程方法，吸收 `grill-with-docs`、`diagnose`、`tdd`、`improve-codebase-architecture`、`zoom-out` 的追问、诊断、测试和架构纪律。

## 适用场景

- SaaS、后台管理、B2B 系统、内部运营系统
- 前后端分离或单体全栈项目
- Java/Spring Boot/MyBatis/MySQL 后端项目
- React/Vue/管理端前端项目
- 需要 AI 参与产品设计、业务建模、接口设计、代码实现和上线审查
- 需要 OpenSpec 作为需求和业务规则事实源

## 核心架构

```text
OpenSpec = 产品、业务、需求、规格、变更和归档事实源
AGENTS.md = 总调度器，定义安全红线和高层入口
docs/SKILL_ROUTING.md = skill 路由、并行、循环、回退和冲突处理
docs/ = 工程、产品、设计、安全、测试和发布规则
.codex/skills/ = 专业工种
profiles/ = 安装 profile，控制复制哪些文件到目标项目
tools/ = 可复制到目标项目的确定性工具，例如代码脚手架
scripts/ = 自动化安装、生成和安全检查
templates/ = 标准产物模板
examples/ = 落地示例
```

## 推荐目录

```text
.
├── AGENTS.md
├── CODEX_TASK_TEMPLATE.md
├── README.md
├── CONTEXT.md
├── CONTEXT-MAP.md
├── openspec/
│   ├── project.md
│   ├── specs/
│   │   └── README.md
│   └── changes/
│       └── README.md
├── docs/
│   ├── PRODUCT_RULES.md
│   ├── BUSINESS_RULES.md
│   ├── UX_RULES.md
│   ├── UI_DESIGN_RULES.md
│   ├── FRONTEND_RULES.md
│   ├── API_RULES.md
│   ├── BACKEND_RULES.md
│   ├── SPRING_BOOT_RULES.md
│   ├── DB_SCHEMA_RULES.md
│   ├── TESTING_RULES.md
│   ├── SECURITY_RULES.md
│   ├── PERFORMANCE_RULES.md
│   ├── CODE_REVIEW_RULES.md
│   ├── SKILL_BASE.md
│   ├── SKILL_NAMING_RULES.md
│   ├── SKILL_ROUTING.md
│   └── RELEASE_RULES.md
├── .codex/
│   ├── AGENTS.md
│   └── skills/
├── profiles/
│   ├── README.md
│   ├── default/
│   │   └── profile.toml
│   ├── gupo/
│   │   └── profile.toml
│   └── minimal/
│       └── profile.toml
├── tools/
│   └── codegen/
│       └── java-springboot-crud-adapters/
├── scripts/
│   ├── install-to-project.sh
│   ├── skill-check.sh
│   ├── route-check.sh
│   ├── docs-link-check.sh
│   └── new-skill.sh
├── templates/
└── examples/
```

## 标准流程

完整路由以 [`docs/SKILL_ROUTING.md`](docs/SKILL_ROUTING.md) 为准。本节只展示常见入口，实际执行时按该文件处理并行、循环、回退和冲突。

### 新功能

```text
product-discovery
-> product-business-domain-modeling
-> workflow-openspec-propose
-> workflow-openspec-grill，如需要追问和术语校准
-> method-grill-with-docs，如仅需术语、CONTEXT 或 ADR 方法补充
-> method-zoom-out，如代码区域陌生或影响范围不清
-> method-architecture-review，如涉及跨模块或架构变化
-> design-ux-review / design-ui-system，如涉及界面
-> backend-common-api-contract-review，如涉及接口
-> dba-mysql，如涉及数据库
-> codegen-java-springboot-crud，如涉及 Java Spring Boot CRUD 脚手架，先识别 adapter
-> frontend-common-implementation / backend-java-springboot
-> frontend-common-tdd / method-tdd / qa-e2e-test
-> security-review / performance-review，如有风险
-> release-production-review
-> release-readiness-review
```

### Bug 修复

```text
method-diagnose / frontend-common-diagnose
-> method-zoom-out，如代码区域陌生或调用链不清
-> workflow-openspec-grill，如发现业务规则不清
-> dba-mysql，如涉及 SQL 或数据
-> backend-java-springboot / frontend-common-implementation
-> 对应测试或最小验证
-> release-production-review
```

### 解耦重构

```text
method-architecture-review
-> method-zoom-out，如需要先建立能力地图
-> workflow-openspec-propose
-> workflow-openspec-grill，如需要追问和术语校准
-> 分批 tasks
-> 测试保护
-> 最小切片实现
-> release-production-review
```

## MVP Skills

第一版提供这些核心 skill：

- `product-discovery`：产品目标、用户、场景、成功指标和范围澄清。
- `product-business-domain-modeling`：领域对象、状态、权限、租户和业务规则建模。
- `workflow-openspec-propose`：创建或完善 OpenSpec change，产出 proposal/design/tasks/specs delta。
- `workflow-openspec-grill`：追问需求、校准术语、压力测试场景，并沉淀到 OpenSpec change。
- `workflow-openspec-apply`：在 change 确认后按 tasks 调度对应角色 skill 执行。
- `workflow-openspec-archive`：实现和验证完成后，将已确认行为归档到 OpenSpec specs。
- `method-grill-with-docs`：Matt Pocock 风格追问、术语校准、CONTEXT 和 ADR 沉淀方法。
- `method-zoom-out`：上升一层抽象，梳理陌生代码区域、能力地图和调用链。
- `method-architecture-review`：架构解耦、模块边界和改造切片。
- `design-ux-review`：用户流程、信息架构、表单、状态和可用性审查。
- `design-ui-system`：设计系统、一致性、组件和视觉质量规则。
- `frontend-common-implementation`：前端页面、状态、接口集成和交互实现。
- `frontend-common-tdd`：前端行为测试、关键路径和回归验证。
- `frontend-common-diagnose`：前端页面、接口、状态和交互异常诊断。
- `design-visual-qa`：多视口、加载态、空态、错误态和视觉回归检查。
- `backend-common-api-contract-review`：API 路径、请求、响应、分页、兼容性和敏感字段审查。
- `dba-mysql`：MySQL 表结构、索引、迁移、回滚和 SQL 安全。
- `codegen-java-springboot-crud`：Java Spring Boot CRUD adapter 路由入口；没有已确认 adapter 时停止询问。
- `codegen-java-springboot-gupo-crud`：gupo 项目专用 Java Spring Boot CRUD adapter。
- `backend-java-springboot`：Java Spring Boot 后端最小安全实现。
- `method-tdd`：后端测试、回归验证和红绿重构。
- `method-diagnose`：后端 bug、SQL、性能和异常诊断。
- `qa-e2e-test`：跨前后端核心流程和发布前验收验证。
- `security-review`：鉴权、越权、敏感数据、注入和安全风险审查。
- `performance-review`：查询、接口、缓存、分页和容量风险审查。
- `release-readiness-review`：发布前清单、回滚方案和验证记录。
- `release-production-review`：最终上线前总审查。

兼容旧入口：

```text
codegen-only -> codegen-java-springboot-crud
mysql-dba -> dba-mysql
springboot-backend -> backend-java-springboot
reviewer -> release-production-review
```

## 多语言扩展命名

后续增加不同后端语言、前端框架时，使用以下命名：

```text
backend-java-springboot
backend-node-nestjs
backend-python-fastapi
frontend-react-admin
frontend-vue-admin
db-postgres-dba
codegen-java-springboot-crud
codegen-java-springboot-gupo-crud
codegen-node-nestjs-crud
```

不要把所有后端能力塞进一个 `backend` skill，也不要把所有前端能力塞进一个 `frontend` skill。

## Codegen Adapter

控制系统不默认提供通用 Java Spring Boot CRUD 脚手架。CRUD 代码生成必须先选择 adapter：

1. 用户显式指定 adapter。
2. 目标项目 `.codex/codegen.toml` 声明 adapter。
3. 安装 profile 或 adapter registry 声明 adapter。
4. 项目指纹高置信命中 adapter。
5. 无法确认时停止询问。

当前只有 gupo adapter 可用，路径为 [`tools/codegen/java-springboot-crud-adapters/gupo`](tools/codegen/java-springboot-crud-adapters/gupo)。通用 adapter 位于 [`tools/codegen/java-springboot-crud-adapters/generic`](tools/codegen/java-springboot-crud-adapters/generic)，状态为未实现。

generic adapter 不可用时，不生成脚手架；但可在用户确认后转入 `backend-java-springboot` 做生产级手写实现。手写实现必须复用既有项目抽象，遵守 API contract、DBA、事务、权限、租户、测试和发布审查要求。

## 安装到项目

推荐使用安装脚本。默认遇到冲突会停止，不会静默覆盖目标项目文件：

```bash
bash scripts/install-to-project.sh --dry-run --profile default /path/to/project
bash scripts/install-to-project.sh --backup --profile default /path/to/project
bash scripts/install-to-project.sh --backup --profile gupo /path/to/gupo-project
```

常用参数：

- `--dry-run`：只预览，不写入。
- `--backup`：冲突路径先备份到目标项目 `.codex-install-backup/<timestamp>/`。
- `--force`：覆盖目标路径。
- `--merge`：目录级合并；文件冲突仍需 `--backup` 或 `--force`。
- `--only <path>`：只安装指定条目，可重复。
- `--profile <name|path>`：使用 `profiles/<name>/profile.toml` 或指定 profile 文件。

profile 定义见 [`profiles/README.md`](profiles/README.md)。

## 自动检查

```bash
bash scripts/skill-check.sh
bash scripts/route-check.sh
bash scripts/docs-link-check.sh
bash scripts/openspec-check.sh openspec/changes/<change-id>
```

新增 skill 使用：

```bash
bash scripts/new-skill.sh backend-node-nestjs "NestJS 后端实现 skill，用于..."
```

## 核心原则

- OpenSpec 管“事实源”。
- Matt-style skills 管“工程方法”。
- 本仓库自带 skills 管“全栈落地和安全闸门”。
- 不清楚就停止并询问。
- 非简单任务先进入 OpenSpec。
- 业务规则必须成为事实源，不能只留在聊天里。
- 数据库写操作必须确认。
- 标准 CRUD 必须先选择 codegen adapter；未确认 adapter 时禁止生成脚手架。generic adapter 缺失时，可确认后生产级手写实现。
- 实现必须有验证。
- 交付必须有审查。
