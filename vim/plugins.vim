" Vim Sensible - https://github.com/tpope/vim-sensible
Plug 'tpope/vim-sensible'

" Linting
Plug 'dense-analysis/ale' " Asynchronous Linting - https://github.com/dense-analysis/ale/blob/master/supported-tools.md

" Syntax
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'thoughtbot/vim-rspec'
Plug 'fatih/vim-go'
Plug 'cespare/vim-toml'
Plug 'google/vim-jsonnet'
Plug 'hashivim/vim-terraform' "This plugin adds a :Terraform command that runs terraform, with tab completion of subcommands. It also sets up *.tf, *.tfvars, and *.tfstate files to be highlighted as HCL, HCL, and JSON respectively.
Plug 'tsandall/vim-rego'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

Plug 'tpope/vim-surround' " Quoting/parenthesizing made simple - https://github.com/tpope/vim-surround

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'     " Git commands in vim - https://github.com/tpope/vim-fugitive
Plug 'airblade/vim-gitgutter' " Shows a git diff in the gutter - https://github.com/airblade/vim-gitgutter

" Misc
Plug 'vim-airline/vim-airline' 	    " Improved Status Bar - https://github.com/vim-airline/vim-airline
Plug 'preservim/nerdtree'           " Tree explorer
Plug 'Xuyuanp/nerdtree-git-plugin'  " Git status highlighting for NERDTree
Plug 'google/vim-searchindex'       " Display number of search matches & index of a current match
Plug 'bogado/file-line'             " Enable opening a file in a given line (ex. vim index.html:20)
Plug 'aserebryakov/vim-todo-lists'  " Vim plugin for TODO lists management.

" vim-ack - https://github.com/mileszs/ack.vim
Plug 'mileszs/ack.vim'

" tabular - https://github.com/godlygeek/tabular
Plug 'godlygeek/tabular'

" markdown-preview - https://github.com/iamcco/markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Color Schema
Plug 'altercation/vim-colors-solarized'

"Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Completor
Plug 'maralla/completor.vim'

Plug 'AndrewRadev/splitjoin.vim'
