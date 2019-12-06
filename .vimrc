""" Install Plugin Manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""" Plugins
call plug#begin('~/.vim/plugged')
" Vim Sensible - https://github.com/tpope/vim-sensible
Plug 'tpope/vim-sensible'
" ctrlp.vim - https://github.com/ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'
" vim-gitgutter - https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'
" vim-fugitive - https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'
" vim-ack - https://github.com/mileszs/ack.vim
Plug 'mileszs/ack.vim'
call plug#end()

""" Options

" Set line numbers
set number
" Indent using 2 spaces
set tabstop=2
" When shifiting, indent using 2 spaces
set shiftwidth=2
" Convert tabs to space
set expandtab
" Set the window's title, reflecting the file currently being edited
" set title
" Configure clipboard for copy&paster operation
" if has('clipboard')
" if has('unnamedplus')  " When possible use + register for copy-paste
"   set clipboard=unnamed,unnamedplus
" else
"   set clipboard=unnamed
" endif
" endif

"""" CtrlP
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

"""" ack/vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" -----------------------------------------------
" Key Mapping
" -----------------------------------------------
"

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

:nmap cp :let @+=@%
