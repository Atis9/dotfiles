export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export KUBECACHEDIR=$XDG_CACHE_HOME/kube
export GOPATH=$XDG_DATA_HOME/go
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
# 未設定だと p10k が起動のたびに UTF-8 ロケールを探して遅くなる
export LANG=${LANG:-en_US.UTF-8}
