# Git 高频快捷函数

# ========== 状态与查看 ==========
function gst { git status }
function glog { git log --oneline --graph --decorate --all }
function gdiff { git diff }
function gdc { git diff --cached }

# ========== 基础操作 ==========
function gaa { git add --all }
function gap { git add -p }
function gcm { git commit -m $args }
function gca { git commit --amend }
function gcp { git commit --amend --no-edit }

# ========== 分支操作 ==========
function gco { git checkout $args }
function gcb { git checkout -b $args }
function gbr { git branch }
function gmerged { git branch --merged }

# ========== 远程操作 ==========
function gp { git push }
function gpf { git push --force-with-lease }
function gl { git pull }
function gpr { git pull --rebase }

# ========== 撤销与重置 ==========
function gunstage { git reset HEAD $args }
function gdiscard { git checkout -- $args }
function gclean { git clean -fd }
function greset { git reset --hard }

# ========== 其他实用 ==========
function gstash { git stash }
function gstash-pop { git stash pop }
function gclone { git clone $args }
function ginit { git init }
