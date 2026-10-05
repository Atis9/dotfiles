# fzf は mise で入れる (01-mise.zsh より後に読む)
if (( $+commands[fzf] )); then
  source <(fzf --zsh)
fi
