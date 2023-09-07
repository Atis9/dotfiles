alias ll='ls -lh'
alias la='ls -lha'
alias k='kubectl'

if [ `uname` = "Darwin" ]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi
