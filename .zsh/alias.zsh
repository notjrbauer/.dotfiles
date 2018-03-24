# ls
alias ll="ls -al"
alias lr="ls -ltr"
alias dot="cd ~/.dotfiles"

# git status
alias gs="git status"

# git diff
alias gd="git diff"
alias gdc="git diff --cached "

# git log
alias gl="git log"
alias glogn="git log --oneline --graph -n10"

# tig status
alias ts="tig status"

# Django manage.py
alias djrun="python manage.py runserver"
alias djshell="python manage.py shell"

# zshrc source
alias zs="source ~/.zshrc"

# zshrc load benchmark
alias zb="time ( zsh -i -c exit; )"

alias al="alacritty"

# Vim shotchut
alias v=vim

# when not exist vim then start up vi
if type vim > /dev/null 2>&1; then
    alias vi=vim
else
    alias vim=vi
fi

# when not exist nvim then start up vim
if type nvim > /dev/null 2>&1; then
    alias vim=nvim
else
    alias nvim=vim
fi

# Launch markdown diary
function open_diary() {
  mkdir -p ~/diary/$(date "+%Y/%m")
  vim ~/diary/$(date "+%Y/%m/%d.md")
}
alias dia=open_diary


#####################################################################
# lab
#####################################################################
# lab shortcut
alias lb='lab browse'
alias li='lab issue'
alias lm='lab merge-request'
alias lia='lab issue --line=100 --all-repository --opened --assigned-me'
alias lma='lab merge-request --line=100 --all-repository --opened --assigned-me'

# Browse selected issue
lab_browse_issue() {
    LAB_ISSUE=`lab issue --line=100 | fzf -m | awk '{print $1}'`
    if [ -n "${LAB_ISSUE}" ]; then
        lab browse ${LAB_ISSUE}
    fi
}
alias lbi=lab_browse_issue

# Browse selected issue all repository
lab_browse_issue_all() {
    LAB_ISSUE=`lab issue --line=100 --all-repository --opened --assigned-me | fzf -m | awk '{print $1,$2}'`
    if [ -n "${LAB_ISSUE}" ]; then
        NO=`echo ${LAB_ISSUE} | awk '{print $1}'`
        PRJ=`echo ${LAB_ISSUE} | awk '{print $2}'`
        lab browse -p ${PRJ} ${NO}
    fi
}
alias lbia=lab_browse_issue_all

# Browse selected merge request
lab_browse_merge_request() {
    LAB_MR=`lab merge-request --line=100 | fzf -m | awk '{print $1}'`
    if [ -n "${LAB_MR}" ]; then
        lab browse ${LAB_MR}
    fi
}
alias lbm=lab_browse_issue

# Browse selected issue all repository
lab_browse_merge_request_all() {
    LAB_ISSUE=`lab merge-request --line=100 --all-repository --opened --assigned-me | fzf -m | awk '{print $1,$2}'`
    if [ -n "${LAB_ISSUE}" ]; then
        NO=`echo ${LAB_ISSUE} | awk '{print $1}'`
        PRJ=`echo ${LAB_ISSUE} | awk '{print $2}'`
        lab browse -p ${PRJ} ${NO}
    fi
}
alias lbma=lab_browse_merge_request_all


# Select git branch
alias -g B='`git branch --all | grep -v HEAD | fzf -m`'

#####################################################################
# awscli
#####################################################################
if type todoist > /dev/null 2>&1; then
    # aws profile select
    alias awsp='export AWS_DEFAULT_PROFILE=`cat ~/.aws/credentials | grep -e "\[\(.*\)\]" | sed -e "s/\[//g" | sed -e "s/\]//g" | sort | fzf`'
    # aws ec2 ip list
    alias awse='aws ec2 describe-instances | jq -r ".Reservations[].Instances[] | [ .InstanceId, .PublicIpAddress , .PrivateIpAddress, [.Tags[] | select(.Key == \"Name\").Value][] ]  | @tsv " | sort -k3'
fi

#####################################################################
# todoist
#####################################################################
if type todoist > /dev/null 2>&1; then
    # Cmd shutcut
    alias to='todoist'
    # Select todo key
    alias -g T='`todoist list | fzf -m | awk '\''{print $1}'\''`'
fi

#####################################################################
# hub
#####################################################################
alias hb='hub browse'

#####################################################################
# ripgrep
#####################################################################
alias rg='rg --hidden'

#####################################################################
# tmux
#####################################################################
alias tl="tmux ls"
alias ta="tmux attach -t "
alias tk="tmux kill-session -t "
alias tn="tmux new -s "
alias td="tmux detach"
