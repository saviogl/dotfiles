"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE Asynch Lint
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['rubocop'],
\}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_dockerfile_hadolint_use_docker = 'always'
" ====================== Languages ========================== "
"execute printf('source %s/%s', g:config_dir, 'syntax/rails.vim')
execute printf('source %s', '$HOME/.dotfiles/vim/syntax/go.vim')
