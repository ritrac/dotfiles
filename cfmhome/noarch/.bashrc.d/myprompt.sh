# funny prompt :

if [ -z "$MYPROMPT_MODE" ]; then
    MYPROMPT_MODE="normal"
fi

# ubuntu 24.04
test -e /usr/lib/git-core/git-sh-prompt && . /usr/lib/git-core/git-sh-prompt
# gentoo
test -e /usr/share/git/git-prompt.sh && . /usr/share/git/git-prompt.sh

# Git prompt features (read ~/.git-prompt.sh for reference)
export GIT_PS1_SHOWDIRTYSTATE="true"
export GIT_PS1_SHOWSTASHSTATE="true"
export GIT_PS1_SHOWUNTRACKEDFILES="true"
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS="true"

BACKRED="\[\e[01;41m\]"
GREEN="\[\e[01;32m\]"
BLUE="\[\e[01;34m\]"
NORMAL="\[\e[00m\]"

__prompt_command_git() {
    local P="\u@\h"
    if [ "$MYPROMPT_MODE" = 'git' ]; then
	#P="\[\033[01;34m\]$(basename $PWD)"
	P="$GREEN$(basename $PWD)"
    else
	#P="\u@\h\[\033[01;34m\] \w"
	P="\u@\h$BLUE \w"
    fi

    # en bleu git:(BRANCHE) et BRANCHE en rouge
    if [ $1 -eq 0 ]; then
	export PS1="$GREEN$P ${BLUE}git:($(__git_ps1 "%s")${BLUE}) \$$NORMAL "
    else
	#export PS1="\[\033[41m\]$P git:($(__git_ps1 " %s ")) \$\[\033[00m\] "
	export PS1="$BACKRED$P ${BLUE}git:($(__git_ps1 "%s${BACKRED}${BLUE}")) \$$NORMAL "
    fi
}

__prompt_command_std() {
    if [ $1 -eq 0 ]; then
	export PS1="$GREEN\u@\h$BLUE \w \$ $NORMAL"
	export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "
	export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$$NORMAL "
    else
	export PS1="$BACKRED\u@\h$BLUE \w \$ $NORMAL"
    fi
}

__prompt_command() {
    local rc=$?
    if type __git_ps1 1>/dev/null 2>&1; then
	if [ -z "$(__git_ps1)" ]; then
	    __prompt_command_std $rc
	else
	    __prompt_command_git $rc
	fi
    else
	__prompt_command_std $rc
    fi
}

#__prompt_command() {
#         if [ $? -eq 0 ]; then
#                 export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w $\[\033[00m\] "
#         else
#                 export PS1="\[\033[41m\]\u@\h\[\033[01;34m\] \w $\[\033[00m\] "
#         fi
#	 type -t mail 1>/dev/null 2>&1 && mail
#}


alias devmode='test "$MYPROMPT_MODE" = "git" && export MYPROMPT_MODE="normal" || export MYPROMPT_MODE="git"'
export PROMPT_COMMAND=__prompt_command

