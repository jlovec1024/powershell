# PowerShell 配置项目 - 架构约定

> 本文档定义项目的不变规则和设计约定。

## 架构原则

### 1. 单一职责分离

- **profile.ps1** → 唯一职责：加载入口文件（永不修改）
- **init.ps1** → 唯一职责：配置入口和模块调度

### 2. 可扩展性

- 所有功能模块化，便于单独维护
- 支持按需加载，避免启动性能问题

### 3. 安全性

- 敏感信息通过 `.gitignore` 隔离
- Git 历史永远不包含隐私数据

### 4. 可移植性

- 跨设备一致性：所有机器共享相同配置
- 零配置启动：只需设置一次 profile.ps1

## 目录结构

```
powershell/
├─ init.ps1              # 入口文件（必需）
├─ aliases.ps1           # 别名配置
├─ env.ps1              # 环境变量配置
├─ functions/            # 功能模块目录
│  └─ *.ps1             # 功能函数文件
├─ .gitignore            # 隐私保护
├─ AGENTS.md             # 本文档
└─ README.md             # 项目说明
```

## 加载机制

```
PowerShell → $PROFILE → init.ps1 → aliases.ps1 + env.ps1 + functions/*.ps1
```

**profile.ps1 内容**（固定）：

```powershell
if (Test-Path $HOME\powershell\init.ps1) { . $HOME\powershell\init.ps1 }
```

**init.ps1 职责**：

- 加载 `aliases.ps1`
- 加载 `env.ps1`
- 加载 `functions/*.ps1`

**加载语法**：

```powershell
# 显式加载每个文件
. "$PSScriptRoot\aliases.ps1"
. "$PSScriptRoot\env.ps1"
. "$PSScriptRoot\functions\ll.ps1"
```

## 隐私保护

### 敏感信息定义

- 包含用户名的路径：`C:\Users\{username}\...`
- API 密钥、访问令牌
- 个人邮箱、手机号
- 公司内部路径或服务器地址

### .gitignore 规则

```gitignore
# 敏感配置文件
*secret*.ps1
*private*.ps1

# IDE 和临时文件
.vscode/
.idea/
*.tmp
*.log
```

## 命名规范

### 文件命名

- 小写 + 连字符：`git-helpers.ps1`, `docker-utils.ps1`
- 或小写单词：`aliases.ps1`, `env.ps1`

### 函数命名

- 遵循动词-名词格式：`get-something`, `update-item`
- 使用小写和连字符：`my-function`, `find-file`

### 别名命名

- 使用小写：`ll`, `la`, `gs`
- 避免覆盖常用命令

## 设计决策

### 为什么选择单一入口文件？

- ✅ `profile.ps1` 路径是硬编码的，修改成本高
- ✅ 单一入口易于维护和理解
- ✅ 所有配置集中在 `powershell/` 目录

### 为什么使用点源加载？

- ✅ 简单直观，易于调试
- ✅ 不需要额外的模块配置
- ✅ 适合个人配置管理场景

---

**版本**: 1.0  
**维护者**: @jlovec1024
