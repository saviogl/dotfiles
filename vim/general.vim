"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""Color Scheme"""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" NAVIGATION Mappings"""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-b> :NERDTreeFind<CR>
" enable line numbers
let NERDTreeShowLineNumbers=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-p> :FZF<CR>
nnoremap <silent> <leader>v :Buffers<CR>
nnoremap <silent> <leader>r :History<CR>
nnoremap <silent> <leader>: :History:<CR>
nnoremap <silent> <leader>/ :History/<CR>
nnoremap <silent> <leader>f :Rg<CR>
nnoremap <silent> <C-f> :Rg <c-r><c-w><CR>
"vnoremap <C-f> "xy:Ag <c-r>x

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MarkdownPreview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-x> <Plug>MarkdownPreviewToggle
"nmap <M-s> <Plug>MarkdownPreviewStop
"nmap <C-p> <Plug>MarkdownPreviewToggle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" SHORTCUTS """""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast saving
nmap <leader>w :w!<cr>
" Fast closing
nmap <leader>q :q<cr>
" Copy Filename to GNOME Clipboard
nmap <leader>cs :let @+=expand("%")<CR>
nmap <leader>cl :let @+=expand("%:p")<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Panes/Tabs
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
noremap <C-Right> :tabnext<cr>
noremap <C-Left> :tabprevious<cr>
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
let g:lasttab = 1
nmap <silent> <Leader>tt :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab = tabpagenr()


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exec "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" Settings """"""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MarkdownPreview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mkdp_auto_close = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow " Horizontal windows should split to bottom
set splitright " Vertical windows should be split to right
set number " Set line numbers
set tabstop=2 " Indent using 2 spaces
set shiftwidth=2 " When shifiting, indent using 2 spaces
set expandtab " Convert tabs to space
set noswapfile " Don't use swapfile
set nobackup " Don't create annoying backup files
set complete+=kspell
"set completeopt=menuone,longest
set shortmess+=c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" FILETYPES """""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup filetype
  "au BufNewFile,BufRead *.tf set filetype=terraform
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" COMPLETION """"""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

let g:completor_complete_options = 'menuone,noselect,preview'
" Enable lsp for go by using gopls
let g:completor_filetype_map = {}
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls'}"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" SNIPPETS """"""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
" list all snippets for current filetype
let g:UltiSnipsListSnippets="<c-l>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" NERCOMMENTER """"""""""""""""""""""""
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
