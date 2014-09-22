
#----------
#  System
#----------

# if not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac



#----------
#  Libraries/Import
#----------

if [ -f ~/.shrc ]; then
    source ~/.shrc
fi



#----------
#  Behaviour
#----------

# history
HISTCONTROL=ignoreboth      # ignore duplicate lines or lines starting with space
HISTFILESIZE=2000
PROMPT_COMMAND='history -a' # force each cmds to be added to history file immediately
shopt -s histappend         # append to the history file, don't overwrite it

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# autocomplete - enable if not already
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi




#----------
#  UI
#----------

# prompt

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
PS1='\[\e[37m\]\t ${debian_chroot:+($debian_chroot)}\[\e[37m\]\u@\h\[\e[37m\]: \[\e[34m\]\w $(__git_ps1 "\[\e[33m\](@%s)\[\e[00m\]")\[\e[00m\] \$ '





#----------
#  One time environment setting
#----------
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
