let g:nrrw_rgn_vert=1

set encoding=UTF-8
set nocompatible 
" set leader to space
let mapleader = ","

call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'rizzatti/dash.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'hashivim/vim-terraform'
Plug 'haishanh/night-owl.vim'
Plug 'burner/vim-svelte'
Plug 'uber/prototool', { 'rtp':'vim/prototool' }
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'suan/vim-instant-markdown', {'rtp': 'after'}
Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'w0rp/ale'
Plug 'altercation/vim-colors-solarized'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'StanAngeloff/php.vim'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'fatih/vim-go'
Plug 'tpope/vim-surround'
Plug 'tmhedberg/SimpylFold'
Plug 'tomasr/molokai'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


set runtimepath^=~/.vim/bundle/node

set termguicolors
set foldmethod=syntax  
set foldlevelstart=30
let javaScript_fold=1  

set t_Co=256
let g:javascript_plugin_jsdoc = 1

let g:SimpylFold_docstring_preview=1
let g:used_javascript_libs = 'ramda,lo-dash,chai,d3,react'

let g:deoplete#enable_at_startup = 1

let g:solarized_termtrans = 1
let g:solarized_termcolors=256
let g:solarized_visibility = "normal"
let g:solarized_contrast = "normal"
set background=light
"colorscheme solarized 
colorscheme molokai 
"colorscheme night-owl 

let g:airline_theme= "cool"
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])

"
let g:indent_guides_enable_on_vim_startup = 1 
let g:indent_guides_guide_size = 1                                              
set ts=2 sw=2 et
" NerdTree
" Automatically close nerdtree if its the only file needed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open nerdtree even if no files are selected
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
 
" Automatically delet files deleted with NerdTree
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen = 1 
" let g:NERDTreeWinSize = 20

" Open nerdtree by default

set autoindent
set fileencoding=utf-8
set encoding=utf-8
set backspace=indent,eol,start 

set incsearch
set gdefault
set showmatch
set hlsearch

set relativenumber 
set nu
set noswapfile
set cursorline 

set winwidth=84
set winheight=5
set winminheight=5
set winheight=999
set splitright

let g:ale_linters = {
\   'javascript': ['standard'],
\  'go': ['golint'],
\'proto': ['prototool-lint'],
\  'typescript':['tslint'],
\  'python': ['pylint', 'pycodestyle'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier-standard'],
\   'html': ['prettier-standard'],
\   'css': ['stylelint-config-standard'],
\   'python': ['isort','yapf', 'autopep8'],
\}


"let g:ale_lint_on_text_changed = 0
"let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1


" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" fzf
nnoremap <c-p> :GFiles<cr>

noremap <Leader>w :w<CR>
noremap <Leader>c :wq<CR>
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <Leader>nt :! npm test<Enter>
nnoremap <Leader>ni :! npm install<Enter>
nnoremap <Leader>jt :! jet test  
inoremap jj <ESC>
map <leader>r :NERDTreeFind<cr>

"map tab
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

"remap the switching between split windows
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
nmap <c-h> <c-w>h
nmap <c-o> <c-w>o
nmap <c-t> <c-w>T

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" AsyncRun
let g:asyncrun_open = 8

"Conc exmaple config from here
"will remove later, as i have time to go through them
 
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:coc_node_path = '/Users/obeng/.nvm/versions/node/v10.17.0/bin/node' 
autocmd FileType json syntax match Comment +\/\/.\+$+

