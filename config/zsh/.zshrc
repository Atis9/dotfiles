# Powerlevel10k instant prompt。コンソール入力を伴う処理はこれより上に書く
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# compinit は antigen に 1 回だけ -C で呼ばせる。
# ANTIGEN_COMPINIT_OPTS は antigen の init.zsh に焼き込まれるので固定値にし、
# 24 時間を超えた dump は消して次の compinit で作り直させる
ANTIGEN_COMPDUMP=$XDG_CACHE_HOME/zsh/zcompdump
ANTIGEN_COMPINIT_OPTS='-C'
() {
    setopt local_options extended_glob
    [[ -n $ANTIGEN_COMPDUMP(#qN.mh+24) ]] && rm -f $ANTIGEN_COMPDUMP
}

if [[ -a $XDG_DATA_HOME/antigen ]]; then
    source $XDG_DATA_HOME/antigen/antigen.zsh

    antigen bundle $ZDOTDIR/plugins
    antigen bundle $ZDOTDIR/local
    antigen bundles < $ZDOTDIR/bundles
    [ -f $ZDOTDIR/.p10k.zsh ] && source $ZDOTDIR/.p10k.zsh
    antigen theme romkatv/powerlevel10k
    antigen apply
fi
