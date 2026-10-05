# Powerlevel10k instant prompt。コンソール入力を伴う処理はこれより上に書く
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# compinit は antigen に 1 回だけ呼ばせる。dump が 24 時間以内なら再生成チェックを省く (-C)
ANTIGEN_COMPDUMP=$XDG_CACHE_HOME/zsh/zcompdump
if [[ -n $ANTIGEN_COMPDUMP(#qN.mh-24) ]]; then
    ANTIGEN_COMPINIT_OPTS='-C'
else
    ANTIGEN_COMPINIT_OPTS='-i'
fi

if [[ -a $XDG_DATA_HOME/antigen ]]; then
    source $XDG_DATA_HOME/antigen/antigen.zsh

    antigen bundle $ZDOTDIR/plugins
    antigen bundle $ZDOTDIR/local
    antigen bundles < $ZDOTDIR/bundles
    [ -f $ZDOTDIR/.p10k.zsh ] && source $ZDOTDIR/.p10k.zsh
    antigen theme romkatv/powerlevel10k
    antigen apply
fi
