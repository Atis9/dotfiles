[[ -e /usr/local/share/zsh-completions ]] && fpath=(/usr/local/share/zsh-completions $fpath)

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:sudo:*' command-path $PATH
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

ZSH_COMPLETION_DIR=$XDG_CACHE_HOME/zsh/completions
if ! [[ -d $ZSH_COMPLETION_DIR ]]; then
    mkdir -p $ZSH_COMPLETION_DIR
fi
fpath=($ZSH_COMPLETION_DIR $fpath)
[[ -d $HOME/.docker/completions ]] && fpath=($HOME/.docker/completions $fpath)

__generate_completion() {
    setopt local_options extended_glob
    local filename=$1
    local file=$ZSH_COMPLETION_DIR/$filename
    local checks=("${(z)2}")
    shift 2

    if [[ ${#${(k)commands}:*checks} != ${#checks} ]]; then
        return
    fi

    if [[ -a $file ]] && [[ -z $file(#qN.mh+24) ]]; then
        return
    fi

    $@ > $file
}

__generate_completion '_gh' 'gh' gh completion -s zsh
__generate_completion '_rustup' 'rustup' rustup completions zsh
__generate_completion '_cargo' 'rustup cargo' rustup completions zsh cargo
__generate_completion '_docker' 'docker' docker completion zsh
__generate_completion '_kubectl' 'kubectl' kubectl completion zsh
__generate_completion '_helm' 'helm' helm completion zsh

# compinit は zsh_plugins.txt の pre: から、fzf-tab を読む直前に 1 回だけ呼ぶ。
# dump が 24 時間以内なら再生成チェックを省く (-C)。古い dump は消して作り直させる
__compinit() {
    setopt local_options extended_glob
    local dump=$XDG_CACHE_HOME/zsh/zcompdump
    [[ -n $dump(#qN.mh+24) ]] && rm -f $dump
    autoload -Uz compinit
    compinit -C -d $dump
}
