# Java Spring Boot CRUD Adapters

本目录存放 Java Spring Boot CRUD 代码生成 adapter。

控制系统本身不假设存在通用脚手架。代码生成必须先选择 adapter，再在 adapter 内根据 Spring Boot 版本选择脚本。

## 判定优先级

1. 用户显式指定 adapter。
2. 目标项目 `.codex/codegen.toml` 声明 adapter。
3. 安装 profile 或 adapter registry 声明 adapter。
4. 项目指纹高置信命中 adapter。
5. 无法确认时停止询问。

## 当前状态

| Adapter | 状态 | 说明 |
|---------|------|------|
| `gupo` | available | 仅适用于 gupo 项目封装和目录约定 |
| `generic` | unavailable | 通用 Java Spring Boot CRUD adapter 尚未实现；可确认后转入生产级手写实现 |

## 目标项目配置

推荐目标项目显式声明：

```toml
# .codex/codegen.toml
[java.springboot.crud]
adapter = "gupo"
```

没有明确 adapter 时，禁止用 gupo 脚手架试生成。

## Adapter 不可用时

如果目标项目不是 gupo，且 generic adapter 尚未实现：
- 不生成脚手架。
- 可在用户确认后转入 `backend-java-springboot` 手写生产级实现。
- 手写实现必须遵守 `docs/SPRING_BOOT_RULES.md` 和 `docs/BACKEND_RULES.md` 的抽象、封装、事务、契约、测试和审查要求。
