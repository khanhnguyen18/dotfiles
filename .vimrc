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
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
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

" Esc
inoremap jk <esc> 

" Select all
nnoremap <C-a> gg<S-v>G

" Leader tools
nnoremap <leader>q :wq<CR>
nnoremap <leader>o <C-w><C-o>

" Change page up/down
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Nerdtree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Reload syntax
nnoremap <leader>r :exe ':w \| :syn off \| :syn on'<CR>

" Vim Markdown
let g:vim_markdown_folding_disabled = 1

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

" Vim fugitive
nnoremap gs :G<CR>

nmap <leader>z :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Vim markdown anchor
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_anchorexpr = "'>'.v:anchor"

" Vim fuzzy finder
nnoremap <leader>b :Buffers<CR>
nnoremap <C-f> :BLines<CR>
nnoremap <leader>/ :Files<CR>
nnoremap <leader>' :Marks<CR>
nnoremap <leader>f :Rg<CR>
nnoremap <leader>g :Commits<CR>
nnoremap <leader>H :Helptags<CR>
nnoremap <leader>hh :History<CR>
nnoremap <leader>h: :History:<CR>
nnoremap <leader>h/ :History/<CR>
