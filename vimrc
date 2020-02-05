" Optionally, we could include the defaults.vim file.
"source $VIMRUNTIME/defaults.vim

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

" Turn on filetype detection, automatic per-filetype loading, and indentation
filetype plugin indent on
