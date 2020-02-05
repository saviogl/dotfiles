" Must be at the top to make sure it work everywhere
let mapleader = ','
let g:mapleader = ','

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Install VimPlug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""" Plugins Start
call plug#begin('~/.vim/plugged')
" Source plugins.vim and install plugins
execute printf('source %s', '$HOME/.dotfiles/vim/plugins.vim')
call plug#end()
""" Plugins End

execute printf('source %s', '$HOME/.dotfiles/vim/general.vim')
execute printf('source %s', '$HOME/.dotfiles/vim/terminal.vim')
execute printf('source %s', '$HOME/.dotfiles/vim/git.vim')
execute printf('source %s', '$HOME/.dotfiles/vim/syntax.vim')

" Quickly open/reload vim
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
