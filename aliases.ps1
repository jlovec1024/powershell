# PowerShell 别名配置
#
# 用途：定义简单的命令别名（Set-Alias）
# 复杂功能函数请放到 functions/ 目录

# ========== 简单别名示例 ==========
# 注意：Git 相关函数已迁移到 functions/git.ps1

# 示例：常用目录
# function GoToProjects { Set-Location "C:\projects" }
# Set-Alias proj GoToProjects

# 示例：常用命令
# Set-Alias np notepad
# Set-Alias e explorer

