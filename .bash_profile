
#----------
#  Libraries/Import
#----------

# if OS X
if [[ "$(uname)" = "Darwin" ]]; then
    git_path=/usr/local/git
    export PATH=$git_path/bin:$PATH
    [[ -r $git_path/contrib/completion/git-prompt.sh ]] && source $git_path/contrib/completion/git-prompt.sh
    [[ -r $git_path/contrib/completion/git-completion.bash ]] && source $git_path/contrib/completion/git-completion.bash
    [[ -f ~/.bashrc ]] && source ~/.bashrc
fi
