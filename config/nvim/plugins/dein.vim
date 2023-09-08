set nocompatible

let s:dein_base = '$XDG_DATA_HOME/dein'
let s:dein_src = s:dein_base . '/repos/github.com/Shougo/dein.vim'

if isdirectory(expand(s:dein_src))
  execute 'set runtimepath+=' . s:dein_src

  call dein#begin(s:dein_base)

  call dein#add(s:dein_src)

  call dein#add('mattn/vim-lsp-settings')
  call dein#add('prabirshrestha/vim-lsp')
  
  call dein#add('junegunn/fzf', {'build': './install --all --xdg --no-update-rc'})
  call dein#add('junegunn/fzf.vim')

  call dein#add('vim-airline/vim-airline')
  call dein#add('nordtheme/vim')

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

colorscheme nord
