export VISUAL='vim'
export EDITOR=$VISUAL

alias ll='ls -lh'
alias la='ls -lha'
alias k='kubectl'
alias dc='docker compose'
alias half2full='ruby -pe '\''$_.tr!("!-~", "！-～")'\'''

if [[ $OSTYPE == darwin* ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

