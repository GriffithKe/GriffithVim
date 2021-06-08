"                                           _
"       ___ _ __   __ _  ___ ___     __   _(_)_ __ ___
"      / __| -_ \ / _- |/ __/ _ \____\ \ / / | -_ - _ \
"      \__ \ |_) | (_| | (_|  __/_____\ V /| | | | | | |
"      |___/ .__/ \__._|\___\___|      \_/ |_|_| |_| |_|
"          |_|
"
"   Copyright (c) 2017 Liu-Cheng Xu & Contributors
"
"   You can customize space-vim with .spacevim
"   and don't have to take care of this file.
"
"   Author: Liu-Cheng Xu <xuliuchengxlc@gmail.com>
"   URL: https://github.com/liuchengxu/space-vim
"   License: MIT

scriptencoding utf-8

let g:spacevim = get(g:, 'spacevim', {})
let g:spacevim.base = $HOME.'/.space-vim'
let g:spacevim.version = '0.9.0'

" Identify platform {
let g:spacevim.os = {}
let g:spacevim.os.mac = has('macunix')
let g:spacevim.os.linux = has('unix') && !has('macunix') && !has('win32unix')
let g:spacevim.os.windows = has('win32')
" }

" Windows Compatible {
" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if g:spacevim.os.windows
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif
" }

set runtimepath+=$HOME/.space-vim/core

call spacevim#bootstrap()

" Correct spelling
setlocal spell
set spelllang=nl,en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Latex compile
" autocmd BufWritePost *.tex silent! execute "!latexmk % >/dev/null 2>&1" | redraw!

" Plugins {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" 如果要启用自动补全，就注释掉下面这行👇
" let g:loaded_youcompleteme = 1

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" ==============================================================================================
"                                   Plugins
" ==============================================================================================
" +---  4 lines: Vundle ------------------------------------------------------------
" +---  4 lines: Airline -----------------------------------------------------------
" +---  9 lines: Colorschemes ------------------------------------------------------
" +---  8 lines: Syntax and Grammar Checking----------------------------------------
" +--- 10 lines: Miscellaneosu git, etc---------------------------------------------
" +---  3 lines: Jupyter------------------------------------------------------------
" +---  3 lines: Ctags automatic update---------------------------------------------
" +---  3 lines: asynchronous lint engine (ALE)-------------------------------------
" ==============================================================================================
" {{{ asynchronous lint engine (ALE)
"Plugin 'dense-analysis/ale'
" }}}
" {{{
    Plugin 'ycm-core/YouCompleteMe'
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    let g:SuperTabDefaultCompletionType = '<C-n>'
" }}}

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" 安装vim-tex
let mapleader='\'
Plugin 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" 安装UltiSnips
Plugin 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Shortcuts

inoremap <C-c> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-c> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>


