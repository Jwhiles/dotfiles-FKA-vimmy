vim.cmd([[
if has('nvim')
  au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au! FileType fzf tunmap <buffer> <Esc>
endif

" kassio/neoterm
let g:neoterm_default_mod = 'vertical'
" let g:neoterm_size = 100
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
let g:neoterm_term_per_tab = 1
nnoremap <c-y> :Ttoggle<CR>
inoremap <c-y> <Esc>:Ttoggle<CR>
tnoremap <c-y> <c-\><c-n>:Ttoggle<CR>
nnoremap <leader>x :TREPLSendLine<CR>
vnoremap <leader>x :TREPLSendSelection<CR>
if has('nvim')
  au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
endif


"" automatically update on file changes
set autoread

"" Attempt to determine the type of a file based on its name and possibly its
"" contents. Use this to allow intelligent auto-indenting for each filetype,
"" and for plugins that are filetype specific.
filetype indent plugin on


"" Disable model lines to prevent possible security problems
set nomodeline


"" --- Basic Usability Options ---

"" be rid of swp files
set noswapfile

"" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

"" When opening a new line and no filetype-specific indenting is enabled, keep
"" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

"" Stop certain movements from always going to the first character of a line.
"" While this behaviour deviates from that of Vi, it does what most users
"" coming from other editors would expect.
set nostartofline

"" Instead of failing a command because of unsaved changes, instead raise a
"" dialogue asking if you wish to save changed files.
set confirm

"" Quickly time out on keycodes, but never time out on mappings
"set notimeout ttimeout ttimeoutlen=200

" " Colour the 81st (or 73rd) column so that we don’t type over our limit
set colorcolumn=+1
highlight ColorColumn ctermbg=23
" " In Git commit messages, also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51


""------------------------------------------------------------
"" Useful mappings

"" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
"" which is the default
map Y y$




""------------------------------------------------------------
"" appearance

"" Keep the cursor seven characters from top or bottom of screen
set so=7


""------------------------------------------------------------
"" plugin related settings

"" ---- fugitive -----
nnoremap <leader>gg :G <CR>

"" map leader key then s to open the location list
: :nnoremap <leader>s :lopen<CR>
" :nnoremap <leader>S :lclose<CR>

" quickly toggle to the last open file
:nnoremap \\ <C-^><CR>


" remap S to overwrite the word with what's in the register
nnoremap S "_diwP




" autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)

set spell spelllang=en_us
]])
