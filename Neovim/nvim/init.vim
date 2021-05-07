:set tabstop=2
:set shiftwidth=2
:set expandtab
:set selection=exclusive

call plug#begin(stdpath('data') . '/plugged')
Plug 'justinmk/vim-sneak'
call plug#end()

:imap ;l <Esc>

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
