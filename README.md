# PowerShell 配置仓库

个人 PowerShell 配置，支持跨设备同步和版本控制。

## 特性

- 📦 模块化架构，易于扩展
- 🔄 Git 版本控制，多设备同步
- 🔒 隐私保护机制

## 快速开始

```bash
# 1. 克隆仓库
git clone git@github.com:jlovec1024/powershell.git ~/powershell

# 2. 配置 profile
if (!(Test-Path $PROFILE)) { New-Item -Type File $PROFILE -Force }
Set-Content -Path $PROFILE -Value "if (Test-Path `$HOME\powershell\init.ps1) { . `$HOME\powershell\init.ps1 }"

# 3. 重启 PowerShell
```

## 维护

详见 [AGENTS.md](AGENTS.md) 架构约定。

## 许可证

MIT
