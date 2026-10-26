# fzf は mise で入れる (01-mise.zsh より後に読む)
# fzf --zsh の出力をキャッシュする。1 行目に fzf の実体パスを書いておき、
# バージョンが変わってパスが変わったら作り直す (mise のバイナリは mtime がリリース日のままで当てにならない)
if (( $+commands[fzf] )); then
  __fzf_bin=${commands[fzf]:A}
  if [[ ${__fzf_bin:t} != fzf ]]; then
    # mise の shim などで実体からバージョンを判別できないときはキャッシュしない
    source <(fzf --zsh)
  else
    __fzf_zsh=$XDG_CACHE_HOME/zsh/fzf.zsh
    __fzf_line=
    [[ -r $__fzf_zsh ]] && IFS= read -r __fzf_line <$__fzf_zsh
    if [[ $__fzf_line != "# $__fzf_bin" ]]; then
      mkdir -p ${__fzf_zsh:h}
      # 同時に起動したシェルが書きかけを読まないよう、成功したときだけ差し替える
      { print -r -- "# $__fzf_bin" && fzf --zsh } >|$__fzf_zsh.$$ && mv -f $__fzf_zsh.$$ $__fzf_zsh
      rm -f $__fzf_zsh.$$
    fi
    [[ -r $__fzf_zsh ]] && source $__fzf_zsh
    unset __fzf_zsh __fzf_line
  fi
  unset __fzf_bin
fi
