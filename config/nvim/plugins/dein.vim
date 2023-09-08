set nocompatible

let s:dein_base = '$XDG_DATA_HOME/dein'
let s:dein_src = s:dein_base . '/repos/github.com/Shougo/dein.vim'

if isdirectory(expand(s:dein_src))
  execute 'set runtimepath+=' . s:dein_src

  call dein#begin(s:dein_base)

  call dein#add(s:dein_src)

  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#end()

  if has('filetype')
    filetype indent plugin on
  endif

  if has('syntax')
    syntax on
  endif

  if dein#check_install()
    call dein#install()
  endif
endif
