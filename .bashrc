
###############################################################################
#             Settings from Eric Kapilik's .bashrc on GitHub                  #
###############################################################################
# aliases
alias cls='clear && ls'
alias vime='vim +NERDTree'
alias tat='tmux attach -t'
alias gs='git status'
alias gd='git diff'
alias gg='git gui'
alias gm='git commit -m'
alias gl='git log'

# git editor settings
export VISUAL=vim
export EDITOR="$VISUAL"
export GIT_EDITOR=vim

# adding git branch to prompt
_parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
parse_git_branch() {
	OUTPUT=$(_parse_git_branch)
	LENGTH=${#OUTPUT}
	if [ $LENGTH -ne 0 ]; then
		printf " %s " $OUTPUT
	fi
}
# Add the following to the PS1 declaration
# \[\033[33m\]$(parse_git_branch)
###############################################################################
