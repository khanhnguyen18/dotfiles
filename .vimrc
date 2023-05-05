set cul

set termguicolors
set background=dark
set clipboard=unnamed
set directory^=$HOME/.vim/tmp//

" Show line number
set number
set relativenumber

" Use neosolarize theme
let g:neosolarized_termtrans=1
runtime ./colors/NeoSolarized.vim
colorscheme NeoSolarized

" Fix always show mouse block issue
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

call plug#begin()
  Plug 'tpope/vim-surround'
  Plug 'preservim/nerdtree'
  Plug 'vim-scripts/ReplaceWithRegister'
  Plug 'godlygeek/tabular'
  Plug 'preservim/vim-markdown'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install' }
call plug#end()

" Mapping Section ----------------------------------------
nnoremap x "_x

" Increment/Decrement
nnoremap - <C-x>
nnoremap + <C-a>

" Split window
nnoremap ss :split<Return><C-w>w<CR>
nnoremap sv :vsplit<Return><C-w>w<CR>

" Move window
nnoremap <Space> <C-w>w
nnoremap sh <C-w>h
nnoremap sk <C-w>k
nnoremap sj <C-w>j
nnoremap sl <C-w>l

" New tab
nnoremap te :tabedit<CR>

" Resize window

" Select all
nnoremap <C-a> gg<S-v>G

" Leader tools
nnoremap <leader>w :w<CR>
nnoremap <leader>o :so<CR>

" Change page up/down
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Nerdtree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Reload syntax
nnoremap <leader>r :exe ':syn off \| :syn on'<CR>

" Vim Markdown
let g:vim_markdown_folding_level=2

function! MarkdownSwitchStatus()
  let current_line = getline('.')
  if match(current_line, '^\s*[*\-+] \[ \]') >= 0
    call setline('.', substitute(current_line, '^\(\s*[*\-+]\) \[ \]', '\1 [x]', ''))
    return
  endif
  if match(current_line, '^\s*[*\-+] \[x\]') >= 0
    call setline('.', substitute(current_line, '^\(\s*[*\-+]\) \[x\]', '\1', ''))
    return
  endif
  if match(current_line, '^\s*[*\-+] \(\[[x ]\]\)\@!') >= 0
    call setline('.', substitute(current_line, '^\(\s*[*\-+]\)', '\1 [ ]', ''))
    return
  endif
  if match(current_line, '^\s*#\{1,5}\s') >= 0
    call setline('.', substitute(current_line, '^\(\s*#\{1,5}\) \(.*$\)', '\1# \2', ''))
    return
  endif
  if match(current_line, '^\s*#\{6}\s') >= 0
    call setline('.', substitute(current_line, '^\(\s*\)#\{6} \(.*$\)', '\1# \2', ''))
    return
  endif
endfunction
nnoremap <leader>s :call MarkdownSwitchStatus()<CR>

" Markdown preview
nmap <C-s> <Plug>MarkdownPreview
nmap <Leader>p <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle




