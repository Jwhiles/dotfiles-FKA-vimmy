vim.cmd([[
" junegun/fzf.vim
nnoremap <leader><space> :GFiles<CR>
nnoremap <leader>FF :Files<CR>
nnoremap <leader>cc :History:<CR>
nnoremap <leader>ff :Rg<CR>
nnoremap <leader>fb :Buffers<CR>
inoremap <expr> <c-x><c-f> fzf#vim#complete#path(
    \ "find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
    \ fzf#wrap({'dir': expand('%:p:h')}))
if has('nvim')
  au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au! FileType fzf tunmap <buffer> <Esc>
endif
]])
