if type kubectl > /dev/null 2>&1; then
  source <(kubectl completion zsh)
fi

if type helm > /dev/null 2>&1; then
  source <(helm completion zsh)
fi
