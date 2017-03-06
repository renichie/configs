# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# remember (almost) everything
export HISTFILESIZE=3000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

PS1='\[\e[33m\]\u' #username
PS1=$PS1'\[\e[m\]:\[\e[1;34m\]\h' #':host'
PS1=$PS1'\[\e[m\]:\[\e[1;34m\][\w]' # path
#PS1=$PS1'\[\e[1;30m\]$(parse_git_branch)' #git branch
PS1=$PS1'\[\e[m\]> ' #prompt

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
#sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

######################################  ALIASES  ########################################
alias ll='ls -gGh'
alias lr='ls -lash'
alias la='ls -A'
alias l='ls -CF'

alias hs=history
alias open='xdg-open'
alias adjMonitors='xrandr --output VGA-0 --left-of DVI-I-1'

#sshs
alias faui06='ssh -X faui06.informatik.uni-erlangen.de -l sidaeich -i ~/.ssh/cip'
#alias faui00b='ssh sidaeich@faui00b.informatik.uni-erlangen.de'
alias uranos='ssh renichie.hopto.org -l bernd -i ~/.ssh/uranos'

#scps
alias scip='scp -i ~/.ssh/cip'
alias sd='sudo shutdown now'
