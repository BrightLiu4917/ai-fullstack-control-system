# Spring Boot 规则

## 技术栈基线
- Java 17+
- Spring Boot 3 优先
- MyBatis-Plus + MyBatis XML，如项目采用
- MySQL 8，如项目采用
- 既有项目使用 Redis 时才使用 Redis
- 既有项目使用 OpenAPI/Knife4j 时才修改 API 文档

## DTO/VO 命名
- 创建请求：`XxxCreateReq`
- 更新请求：`XxxUpdateReq`
- 分页请求：`XxxPageReq`
- 响应对象：`XxxVO`

## 事务
以下场景必须使用事务：
- 写入多张表
- 修改状态并写入日志
- 创建主记录和明细
- 扣减库存、余额、套餐次数
- 创建订单、支付、通知等联动数据

## 验证
后端变更必须优先运行项目既有验证命令。
无法运行时必须说明原因。
