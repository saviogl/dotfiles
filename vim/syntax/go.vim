" vim-go
let g:go_autodetect_gopath = 1
let g:go_auto_type_info = 1  " Automatically get signature/type info for object under cursor
let g:go_fmt_command = 'goimports' " Run goimports along gofmt on each save
let g:go_list_type = 'quickfix'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_metalinter_command = 'gometalinter --vendor --enable=vet --enable=vetshadow --enable=golint --enable=ineffassign --enable=goconst --enable=gocyclo --enable=misspell --enable=gosimple --enable=interfacer --enable=unconvert --enable=structcheck --enable=varcheck --enable=deadcode --enable=dupl --line-length=100 --tests .'
let g:go_updatetime = 100
" let g:go_term_enabled = 1
" let g:go_term_mode = 'vsplit'

augroup go
  " Shortcut commands for :GoAlternate
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END
