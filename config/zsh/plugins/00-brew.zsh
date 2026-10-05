# brew shellenv の出力をキャッシュする。brew 本体が更新されたら作り直す
for __brew in /opt/homebrew/bin/brew /home/linuxbrew/.linuxbrew/bin/brew; do
  [[ -x $__brew ]] || continue
  __brew_shellenv=$XDG_CACHE_HOME/zsh/brew-shellenv.zsh
  if [[ ! -s $__brew_shellenv || $__brew -nt $__brew_shellenv ]]; then
    mkdir -p ${__brew_shellenv:h}
    $__brew shellenv zsh >| $__brew_shellenv
  fi
  source $__brew_shellenv
  break
done
unset __brew __brew_shellenv
