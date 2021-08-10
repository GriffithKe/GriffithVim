set nocompatible
filetype plugin indent on
set fileencodings=utf-9,ucs-bom,gb18030,gbk,gb2312,cp936
set encoding=utf-8
set nu
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set autoindent

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline'

" Display vertical lines for alignment
Plugin 'Yggdroot/indentLine'

" antarctica: Bluish color scheme for Vim
Plugin 'cocopon/iceberg.vim'

" The NERDTree is a file system explorer for the Vim editor
Plugin 'preservim/nerdtree'
Plugin 'ryanoasis/vim-devicons'

" the ultimate snippet solution for Vim
Plugin 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackForwardTrigger = '<s-tab>'

" code-completion engine for Vim
Plugin 'valloric/youcompleteme'

" use latex
Plugin 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" use markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
call vundle#end()

" configure the operations when I launch vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" configure some keybindings
inoremap <C-j> <Esc>o
inoremap <C-l> <Right>

colorscheme iceberg
syntax on
