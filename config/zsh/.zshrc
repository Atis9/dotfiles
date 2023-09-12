if [[ -a $XDG_DATA_HOME/antigen ]]; then
    source $XDG_DATA_HOME/antigen/antigen.zsh

    antigen bundle $ZDOTDIR/plugins
    antigen bundle $ZDOTDIR/local
    antigen bundles < $ZDOTDIR/bundles
    [ -f $ZDOTDIR/.p10k.zsh ] && source $ZDOTDIR/.p10k.zsh
    antigen theme romkatv/powerlevel10k
    antigen apply
fi
