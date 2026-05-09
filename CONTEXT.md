# Project Context

本文件用于记录项目领域语言。它不是实现文档，也不是接口文档。

复制到具体项目后，应把业务专家、产品、设计、前后端都使用的术语沉淀在这里，避免 AI 和工程师用不同词描述同一件事。

## Language

**Capability**:
一个可独立描述、变更和验收的业务能力。
_Avoid_: module, feature, page，除非确实指代码模块、功能点或页面。

**Actor**:
系统中的业务角色，例如管理员、医生、患者、运营人员。
_Avoid_: user，当需要区分具体业务身份时不要只说 user。

**Workflow**:
由状态、动作、权限和结果组成的业务流程。
_Avoid_: process，当需要表达业务状态流转时使用 Workflow。

**Contract**:
前后端或系统之间必须保持兼容的约定，包括 API、字段、响应结构和错误语义。
_Avoid_: interface，当重点是兼容约束时使用 Contract。

## Relationships

- A **Capability** contains one or more **Workflows**.
- A **Workflow** is performed by one or more **Actors**.
- A **Contract** connects frontend, backend, and external systems.

## Example dialogue

> **Product:** "管理员审核预约时，需要看到冲突原因。"
> **Engineer:** "这里的 **Actor** 是管理员，**Workflow** 是预约审核，冲突原因属于审核 **Capability** 的展示规则。"

## Flagged ambiguities

- 待补充。
