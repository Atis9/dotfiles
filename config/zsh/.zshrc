# Powerlevel10k instant prompt。コンソール入力を伴う処理はこれより上に書く
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 自前の設定。ファイル名順に読むので、依存があるものは番号で順序を付ける
for __f in $ZDOTDIR/{plugins,local}/*.zsh(N); do
  source $__f
done
unset __f

# 外部プラグイン。zsh_plugins.txt が更新されたときだけ静的ファイルを作り直す
ANTIDOTE_HOME=$XDG_CACHE_HOME/antidote
__zsh_plugins=$XDG_CACHE_HOME/zsh/zsh_plugins.zsh
if [[ -r $XDG_DATA_HOME/antidote/antidote.zsh ]]; then
  if [[ ! $__zsh_plugins -nt $ZDOTDIR/zsh_plugins.txt ]]; then
    mkdir -p ${__zsh_plugins:h}
    rm -f $XDG_CACHE_HOME/zsh/zcompdump  # fpath が変わるので補完の dump も作り直す
    (
      source $XDG_DATA_HOME/antidote/antidote.zsh
      antidote bundle <$ZDOTDIR/zsh_plugins.txt >|$__zsh_plugins
    )
  fi
  source $__zsh_plugins
fi
unset __zsh_plugins

[[ -f $ZDOTDIR/.p10k.zsh ]] && source $ZDOTDIR/.p10k.zsh
