export VISUAL='vim'
export EDITOR=$VISUAL

alias ll='ls -lh'
alias la='ls -lha'
alias k='kubectl'

if [ `uname` = "Darwin" ]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

if (( $+commands[nvim] )); then
  export VISUAL='nvim'
  export EDITOR=$VISUAL
  alias vim=$VISUAL
fi

