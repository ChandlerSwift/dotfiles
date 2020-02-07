set nocompatible

"==============
" Begin Vundle
"==============
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

Plugin 'junegunn/fzf'

Plugin 'airblade/vim-gitgutter'
set updatetime=100

call vundle#end()
filetype plugin indent on

"==============
" End Vundle
"==============

set number
syntax on

" https://stackoverflow.com/a/1675752
" ,space:·
set list
set listchars=tab:>-,trail:~
noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>
hi SpecialKey ctermfg=DarkGray

" Show status line with full filename
set laststatus=2
set statusline+=%F
