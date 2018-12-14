# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias vi=vim
alias tmux="tmux -2"

#export GOPATH=/home/xiaohui/go
#export GOBIN=$GOPATH/bin
export PATH=$PATH:~/bin

export RIPGREP_CONFIG_PATH=${HOME}/.ripgreprc

