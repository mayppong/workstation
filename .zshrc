
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
SAVEHIST=1000
setopt hist_ignore_dups inc_append_history share_history 

# autocomplete
autoload -Uz compinit && compinit
setopt complete_in_word
setopt always_to_end

setopt autocd extendedglob
bindkey -e



#----------
#  UI
#----------

autoload colors && colors
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats '@%b'

precmd () {
    local staged=`expr $(git status --porcelain 2>/dev/null| grep "^[MA]" | wc -l)`
    local changed=`expr $(git status --porcelain 2>/dev/null| grep "^ M" | wc -l)`
    local untracked=`expr $(git status --porcelain 2>/dev/null| grep "^??" | wc -l)`

    psvar=()
    vcs_info
    [[ -n $vcs_info_msg_0_ ]] && psvar[1]="($vcs_info_msg_0_ $staged | $changed | $untracked)"
}

PROMPT="%{$fg[white]%}%* %n@%m:%{$reset_color%} %{$fg[blue]%}%~%{$reset_color%} %{$fg[yellow]%}%1v%{$reset_color%}
>> "
