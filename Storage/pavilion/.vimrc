" para habilitar chiches
set nocompatible
set t_Co=256

" basico
set number ruler hlsearch
set laststatus=2
colo thinkpad

" remapeamos algunas cosas
noremap <F12> :update<CR>
inoremap <F12> <ESC>:update<CR>
" en Debian es importante agregar en /etc/bash.bashrc
" setxkbmap -option caps:escape

" this keep current line centered on the screen
set scrolloff=5

" fundamental para programar
filetype plugin on
filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" On pressing tab, insert 4 spaces
set expandtab
