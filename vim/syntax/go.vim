let g:go_fmt_command = 'goimports' " Run goimports along gofmt on each save     
let g:go_auto_type_info = 1  " Automatically get signature/type info for object under cursor
let g:go_metalinter_command = 'gometalinter --vendor --enable=vet --enable=vetshadow --enable=golint --enable=ineffassign --enable=goconst --enable=gocyclo --enable=misspell --enable=gosimple --enable=interfacer --enable=unconvert --enable=structcheck --enable=varcheck --enable=deadcode --enable=dupl --line-length=100 --tests .'

" Shortcut commands for :GoAlternate
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
"autocmd FileType go nmap <c-i> <Plug>(go-info)
"autocmd FileType go nmap <leader>b  <Plug>(go-build)
"autocmd FileType go nmap <leader>r  <Plug>(go-run)

"let g:go_auto_sameids = 1 " highlight var references on hover
let g:go_updatetime = 100
