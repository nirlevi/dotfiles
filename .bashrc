export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting



export CLICOLOR=1
alias ls='ls -Fa'
alias etcd='curl -w "\n" https://discovery.etcd.io/new'
alias digg='dig $1 +nostats +nocomments +nocmd'
alias syslog="tail -f /var/log/syslog"

# define colors
C_DEFAULT="\[\033[m\]"
C_BLUE="\[\033[34m\]"
C_DARKGRAY="\[\033[1;30m\]"
C_LIGHTGREEN="\[\033[1;32m\]"
C_LIGHTYELLOW="\[\033[1;33m\]"
export PS1="\n$C_LIGHTGREEN\u$C_DARKGRAY@$C_BLUE\h$C_DARKGRAY:$C_LIGHTYELLOW\w$C_DARKGRAY\$$C_DEFAULT "

force_colored_prompt=yes
[[ -s "/home/nir/.gvm/scripts/gvm" ]] && source "/home/nir/.gvm/scripts/gvm"

export NODE_PATH=/usr/share/atom/resources/app/exports:/usr/share/atom/resources/app/exports:/usr/share/atom/resources/app/exports:/usr/share/atom/resources/app/exports:/usr/share/atom/resources/app/exports
export NODE_PATH=/usr/share/atom/resources/app/exports:/usr/share/atom/resources/app/exports:/usr/share/atom/resources/app/exports:/usr/share/atom/resources/app/exports:/usr/share/atom/resources/app/exports:/home/nir/npm/lib/node_modules:/home/nir/npm/lib/node_modules
