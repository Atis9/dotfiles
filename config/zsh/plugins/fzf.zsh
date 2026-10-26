# fzf は mise で入れる (01-mise.zsh より後に読む)
# fzf --zsh の出力をキャッシュする。fzf 本体が更新されたら作り直す
if (( $+commands[fzf] )); then
  __fzf_zsh=$XDG_CACHE_HOME/zsh/fzf.zsh
  if [[ ! -s $__fzf_zsh || $commands[fzf] -nt $__fzf_zsh ]]; then
    mkdir -p ${__fzf_zsh:h}
    fzf --zsh >| $__fzf_zsh
  fi
  source $__fzf_zsh
  unset __fzf_zsh
fi
