let g:nrrw_rgn_vert=1

set encoding=UTF-8
set nocompatible 
" set leader to space
let mapleader = ","



call plug#begin('~/.vim/plugged')

" Plug 'ryanoasis/vim-devicons'
Plug 'honza/vim-snippets'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'pedrohdz/vim-yaml-folds'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/limelight.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'evanleck/vim-svelte'
Plug 'uber/prototool', { 'rtp':'vim/prototool' }
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'morhetz/gruvbox'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


set runtimepath^=~/.vim/bundle/node

set termguicolors
set foldmethod=syntax  
set foldlevelstart=30
let g:coc_global_extensions =["coc-stylelintplus", "coc-vimlsp","coc-html", "coc-snippets","coc-json",  'coc-go', 'coc-eslint',  'coc-java', 'coc-tsserver', 'coc-pyright']

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

let g:fzf_preview_window = 'right:60%'
let g:airline#extensions#tabline#enabled = 1

let g:gruvbox_contrast_dark = 'hard'
set background=dark
colorscheme gruvbox 
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:airline_theme= "molokai"
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

let g:ctrlsf_auto_preview = 1

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
set nocursorline 

set winwidth=50
set winheight=10 
set winminheight=10 
set winheight=999

set splitright
set splitbelow


" fzf
nnoremap <c-p> :Files<cr>
nnoremap <c-b> :Buffers<cr>

noremap <Leader>w :w<CR>
noremap <Leader>c :wq<CR>
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <Leader>nt :! npm test<Enter>
nnoremap <Leader>ne :! npm run test:integration<Enter>
nnoremap <Leader>nu :! npm run test:unit<Enter>
nnoremap <Leader>ni :! npm install<Enter>
nnoremap <Leader>jt :! jet test  
inoremap jj <ESC>
tnoremap jj  <C-\><C-n>
map <leader>r :NERDTreeFind<cr>
vmap <leader>y "+y"

map <leader>tt :vnew term://zsh<cr>
map <leader>tn :new term://zsh<cr>
map <leader>th <c-w>t<c-w>H 
map <leader>tk <c-w>t<c-w>K 


"map tab
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
nnoremap t1  :tabn 1<CR>
nnoremap t2  :tabn 2<CR>
nnoremap t3  :tabn 3<CR>
nnoremap t4  :tabn 4<CR>
nnoremap t5  :tabn 5<CR>
nnoremap t6  :tabn 6<CR>
nnoremap t7  :tabn 7<CR>
nnoremap t8  :tabn 8<CR>
nnoremap t9  :tabn 9<CR>

"remap the switching between split windows
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
nmap <c-h> <c-w>h
nmap <c-t> <c-w>T
nmap <c-v> <c-w>v
nmap <c-s> <c-w>s
nmap <c-x> <c-w>c


nnoremap <silent> <C-left> :vertical resize +3 <CR>
nnoremap <silent> <c-right> :vertical resize -3 <cr>
nnoremap <silent> <c-up> :resize +3 <cr>
nnoremap <silent> <c-down> :resize -3 <cr>

" tnoremap <c-h> <C-\><C-N><C-w>h
" tnoremap <c-j> <C-\><C-N><C-w>j
" tnoremap <c-k> <C-\><C-N><C-w>k
" tnoremap <c-l> <C-\><C-N><C-w>l
" inoremap <c-h> <C-\><C-N><C-w>h
" inoremap <c-j> <C-\><C-N><C-w>j
" inoremap <c-k> <C-\><C-N><C-w>k
" inoremap <c-l> <C-\><C-N><C-w>l
" nnoremap <c-h> <C-w>h
" nnoremap <c-j> <C-w>j
" nnoremap <c-k> <C-w>k
" nnoremap <c-l> <C-w>l

"if executable('ag')
"  let g:ackprg = 'ag --vimgrep'
"endif
""
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
set updatetime=200

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
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
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent>  gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent>  gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" Use <C-l> for trigger snippet expand.
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>fs  <Plug>(coc-format-selected)
nmap <leader>fs  <Plug>(coc-format-selected)
"
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

nmap <Esc> :call coc#float#close_all() <CR>

let g:coc_snippet_next = '<tab>'

let g:coc_node_path = '/Users/obeng/.nvm/versions/node/v15.5.1/bin/node' 
autocmd FileType json syntax match Comment +\/\/.\+$+

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

set guifont=DroidSansMono_Nerd_Font:h11

vnoremap J :m '>+1<CR>gv-gv
vnoremap K :m '<-2<CR>gv-gv

set lazyredraw 


