export VISUAL='vim'
export EDITOR=$VISUAL

alias ll='ls -lh'
alias la='ls -lha'
alias k='kubectl'
alias dc='docker compose'
alias half2full='ruby -pe '\''$_.tr!("!-~", "！-～")'\'''

if [[ $(uname) = 'Darwin' ]]; then
  alias ls='ls -G'
  alias reset-launchpad='sudo find 2>/dev/null /private/var/folders/ -type d -name com.apple.dock.launchpad -exec rm -rf {} +; killall Dock'
else
  alias ls='ls --color=auto'
fi

if (( $+commands[nvim] )); then
  export VISUAL='nvim'
  export EDITOR=$VISUAL
  alias vim=$VISUAL
fi

