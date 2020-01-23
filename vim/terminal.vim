 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <C-t> to open a new terminal tab
nnoremap <C-t> :tabnew<CR>:term<CR>

" <esc> to get back into normal mode
" tnoremap <esc> <C-\><C-n>

" word-wise jumps
tnoremap <C-Left> <m-b>
tnoremap <C-Right> <m-f>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make exiting terminal doesn't kill split.
" https://github.com/neovim/neovim/issues/5176#issuecomment-238007256
"function! s:termclose() abort
"  let buf = expand('#')
"  if !empty(buf) && buflisted(buf) && bufnr(buf) != bufnr('%')
"    execute 'autocmd BufWinLeave <buffer> split' buf
"  endif
"endfunction
"
"autocmd TermClose *:$SHELL,*:\$SHELL call s:termclose()