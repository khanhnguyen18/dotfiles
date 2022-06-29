" General setting
set mouse=a
syntax on
set ignorecase
set smartcase
set encoding=UTF-8
set number relativenumber
set numberwidth=6
set autoindent

" Tab Settings
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Autocompletion
set wildmode=longest,list,full

" Fix splitting
set splitbelow splitright

" Cursor line
set cursorline
set cursorcolumn
set noswapfile

" Start NERDTree. If a file is specified, move the cursor to its window.
"jautocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p
call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Terminal
  Plug 'voldikss/vim-floaterm'                  " Float terminal
  Plug 'vimwiki/vimwiki'
  Plug 'tomasiser/vim-code-dark'
  " Debug code
  Plug 'puremourning/vimspector'
  Plug 'Valloric/YouCompleteMe'
  " Nerdtree
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-Plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'scrooloose/nerdtree-project-plugin'
  " Status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Source Version Control
  Plug 'tpope/vim-fugitive'      " Git infomation 
  Plug 'airblade/vim-gitgutter'  " Git show changes
  Plug 'samoshkin/vim-mergetool' " Git merge
  Plug 'adelarsq/nerdtree-fzf'
  
  " Add maktaba and codefmt to the runtimepath.
  " (The latter must be installed before it can be used.)
  Plug 'google/vim-maktaba'
  Plug 'google/vim-codefmt'
  " Also add Glaive, which is used to configure codefmt's maktaba flags. See
  " `:help :Glaive` for usage.
  Plug 'google/vim-glaive'
call plug#end()
" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /Users/khanh/SOFT/google-java-format-1.15.0-all-deps.jar"

"Floatterm
nnoremap <leader>t :FloatermNew! --cwd=<c-r>=g:NERDTree.ForCurrentTab().getRoot().path.str()<cr><cr>

"set termguicolors
colorscheme codedark

"VimWiki
hi VimwikiHeader1 guifg=#FF0000
hi VimwikiHeader2 guifg=#00FF00
hi VimwikiHeader3 guifg=#0000FF
hi VimwikiHeader4 guifg=#FF00FF
hi VimwikiHeader5 guifg=#00FFFF
hi VimwikiHeader6 guifg=#FFFF00

" Tell YCM where to find the plugin. Add to any existing values.
let g:ycm_java_jdtls_extension_path = ['/Users/khanh/.vim/plugged/vimspector/gadgets/macos']


" puremourning/vimspector
 fun! GotoWindow(id)
   :call win_gotoid(a:id)
 endfun
 func! AddToWatch()
   let word = expand("<cexpr>")
   call vimspector#AddWatch(word)
 endfunction
let g:vimspector_enable_mappings = 'HUMAN'

 nnoremap <leader>da :call vimspector#Launch()<CR>
 nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
 nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
 nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
 nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
 nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
 nnoremap <leader>di :call AddToWatch()<CR>
 nnoremap <leader>dx :call vimspector#Reset()<CR>
 nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>
 nnoremap <S-k> :call vimspector#StepOut()<CR>
 nnoremap <S-l> :call vimspector#StepInto()<CR>
 nnoremap <S-j> :call vimspector#StepOver()<CR>
 nnoremap <leader>dh :call vimspector#ToggleBreakpoint()<CR>
 nnoremap <leader>de :call vimspector#ToggleConditionalBreakpoint()<CR>
 " Nerdtree

"let NERDTreeShowHidden=1

"nnoremap <F5> :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <C-l> :NERDTreeFind<CR>


" Status bard
let g:airline_powerline_fonts = 1
let g:airline_theme='simple'

"nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
"nnoremap <silent>  <Leader>p :NERDTreeProjectLoad ems<cr>
"nnoremap <silent>  <Leader>p :call g:NERDTreeProject.Open('wks') <cr>
nnoremap <silent>  <Leader>b :Buffers <cr>
nnoremap <silent>  <C-f> :Lines <cr>

function! s:buflist()
  execute 'NERDTreeFocus'
  let l:list = []
  for proj in  g:NERDTreeProject.All()
    call add(l:list, proj._name)
  endfor
  return l:list
endfunction

function! s:bufopen(e)
  execute 'NERDTreeProjectLoad' a:e
endfunction

nnoremap <silent> <Leader>p :call fzf#run({
\   'source':  <sid>buflist(),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" Begin coding script file

source ~/Dropbox/vim/tools.vim
nmap ;s :source ~/Dropbox/vim/tools.vim<CR>
set backspace=indent,eol,start
"Map save file 
nnoremap <C-x> <C-s> :w<cr>
inoremap <c-x><c-s> <c-\><c-o>:w<cr>


function! Test()
  let l:path = '/Users/khanh/Project/hackerrank-project/src/main/java/com/vimspector/test/Java1DApplication.java'
  let l:end = stridx(l:path, '.java')
  let l:begin = stridx(l:path, '/main/java/')
  echo substitute(strpart(l:path, l:begin+ 11, l:end - l:begin -11), "/", ".", "g") 
endfunction
nnoremap ;t :call Test()<cr>
