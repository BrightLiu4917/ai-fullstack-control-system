# 后端规则

## 分层原则
- Controller 只负责接收请求、基础校验、调用 Service、返回统一响应。
- Service/ServiceImpl 负责业务校验、权限、状态流、事务、缓存协调和通知触发。
- Mapper 只定义持久化方法。
- XML 写显式 SQL。

## 禁止调用流
```text
Controller -> Mapper
Mapper -> Service
Controller -> Controller
Entity -> Service
```

## 必须考虑
- 事务边界
- 权限校验
- 租户隔离
- 软删除
- 幂等性
- 重复提交
- 审计日志
- 异常处理
- 数据兼容

## 禁止事项
- 禁止 Controller 写业务逻辑。
- 禁止 Service 拼接 SQL 字符串。
- 禁止静默吞异常。
- 禁止伪实现。
- 禁止无关重构。
