# AI Fullstack Control System

一套可复制到业务项目中的 AI 全栈工程控制系统。

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
AGENTS.md = 总调度器，定义安全红线、流程和 skill 路由
docs/ = 工程、产品、设计、安全、测试和发布规则
.codex/skills/ = 专业工种
tools/ = 可复制到目标项目的确定性工具，例如代码脚手架
scripts/ = 自动化安全检查
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
│   ├── SKILL_NAMING_RULES.md
│   └── RELEASE_RULES.md
├── .codex/
│   ├── AGENTS.md
│   └── skills/
├── tools/
│   └── codegen/
│       └── java-springboot-crud/
├── scripts/
├── templates/
└── examples/
```

## 标准流程

### 新功能

```text
product-discovery
-> business-domain-modeling
-> openspec-grill
-> backend-zoom-out，如代码区域陌生或影响范围不清
-> architecture-review，如涉及跨模块或架构变化
-> ux-review / ui-design-system，如涉及界面
-> api-contract-review，如涉及接口
-> db-mysql-dba，如涉及数据库
-> frontend-implementation / backend-java-springboot / codegen-java-springboot-crud
-> frontend-tdd / springboot-tdd / e2e-test
-> security-review / performance-review，如有风险
-> review-production
-> release-review
```

### Bug 修复

```text
backend-diagnose / frontend-diagnose
-> openspec-grill，如发现业务规则不清
-> db-mysql-dba，如涉及 SQL 或数据
-> backend-java-springboot / frontend-implementation
-> 对应测试或最小验证
-> review-production
```

### 解耦重构

```text
architecture-review
-> openspec-grill
-> 分批 tasks
-> 测试保护
-> 最小切片实现
-> review-production
```

## MVP Skills

第一版提供这些核心 skill：

- `product-discovery`：产品目标、用户、场景、成功指标和范围澄清。
- `business-domain-modeling`：领域对象、状态、权限、租户和业务规则建模。
- `openspec-grill`：把需求追问结果沉淀为 OpenSpec change。
- `backend-zoom-out`：上升一层抽象，梳理陌生代码区域、能力地图和调用链。
- `architecture-review`：架构解耦、模块边界和改造切片。
- `ux-review`：用户流程、信息架构、表单、状态和可用性审查。
- `ui-design-system`：设计系统、一致性、组件和视觉质量规则。
- `frontend-implementation`：前端页面、状态、接口集成和交互实现。
- `visual-qa`：多视口、加载态、空态、错误态和视觉回归检查。
- `api-contract-review`：API 路径、请求、响应、分页、兼容性和敏感字段审查。
- `db-mysql-dba`：MySQL 表结构、索引、迁移、回滚和 SQL 安全。
- `codegen-java-springboot-crud`：Java Spring Boot 标准 CRUD 强制走内置生成器。
- `backend-java-springboot`：Java Spring Boot 后端最小安全实现。
- `springboot-tdd`：后端测试、回归验证和红绿重构。
- `backend-diagnose`：后端 bug、SQL、性能和异常诊断。
- `security-review`：鉴权、越权、敏感数据、注入和安全风险审查。
- `performance-review`：查询、接口、缓存、分页和容量风险审查。
- `release-review`：发布前清单、回滚方案和验证记录。
- `review-production`：最终上线前总审查。

兼容旧入口：

```text
codegen-only -> codegen-java-springboot-crud
mysql-dba -> db-mysql-dba
springboot-backend -> backend-java-springboot
reviewer -> review-production
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
codegen-node-nestjs-crud
```

不要把所有后端能力塞进一个 `backend` skill，也不要把所有前端能力塞进一个 `frontend` skill。

## 安装到项目

复制本仓库中的以下内容到目标项目根目录：

```text
AGENTS.md
CODEX_TASK_TEMPLATE.md
openspec/
docs/
.codex/
scripts/
templates/
tools/
```

也可以使用：

```bash
bash scripts/install-to-project.sh /path/to/project
```

## 核心原则

- OpenSpec 管“事实源”。
- Matt-style skills 管“工程方法”。
- 本仓库自带 skills 管“全栈落地和安全闸门”。
- 不清楚就停止并询问。
- 非简单任务先进入 OpenSpec。
- 业务规则必须成为事实源，不能只留在聊天里。
- 数据库写操作必须确认。
- 标准 CRUD 必须走生成器。
- 实现必须有验证。
- 交付必须有审查。
