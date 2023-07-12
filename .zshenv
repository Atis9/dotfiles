# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if type rbenv > /dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
if type nodenv > /dev/null 2>&1; then
  eval "$(nodenv init -)"
fi

