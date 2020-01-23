"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" NAVIGATION """"""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-b> :NERDTreeFind<CR>
" enable line numbers
let NERDTreeShowLineNumbers=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>to :tabnew<cr>
map <leader>tx :tabclose<cr>
map <leader>tm :tabmove
map <C-M-l> :tabnext<cr>
map <C-M-h> :tabprevious<cr>
map <leader>t1 :tabnext1<cr>
map <leader>t2 :tabnext2<cr>
map <leader>t3 :tabnext3<cr>
map <leader>t4 :tabnext4<cr>
map <leader>t5 :tabnext5<cr>
map <leader>t6 :tabnext6<cr>
map <leader>t7 :tabnext7<cr>
map <leader>t8 :tabnext8<cr>
map <leader>t9 :tabnext9<cr>

" Let 'tt' toggle between this and the last accessed tab
" let g:lasttab = 1
" nmap <silent> <Leader>tt :exe "tabn ".g:lasttab<CR>
" autocmd TabLeave * let g:lasttab = tabpagenr()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the default split to be vertical
set splitbelow
set splitright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" SHORTCUTS """""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast saving
nmap <leader>w :w!<cr>
" Fast closing
nmap <leader>q :q<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" APPEARENCE """"""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set line numbers
set number
" Indent using 2 spaces
set tabstop=2
" When shifiting, indent using 2 spaces
set shiftwidth=2
" Convert tabs to space
set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't create *.swo or *.swp files
set noswapfile
