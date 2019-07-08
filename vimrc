let g:nrrw_rgn_vert=1

filetype  off 

set encoding=UTF-8
set nocompatible 
" set leader to space
let mapleader = ","
execute pathogen#infect()


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'StanAngeloff/php.vim'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-surround'
Plugin 'evanleck/vim-svelte'

syntax on 
filetype indent on
filetype plugin on 

call vundle#end() " required

set runtimepath^=~/.vim/bundle/node
set runtimepath^=~/.vim/bundle/ctrlp.vim

" " colorscheme gruvbox
set termguicolors
set foldmethod=indent
set foldlevelstart=99
set t_Co=256
let javaScript_fold=1  
let g:javascript_plugin_jsdoc = 1
let g:SimpylFold_docstring_preview=1


let g:solarized_termtrans = 1
let g:solarized_termcolors=256
let g:solarized_visibility = "normal"
let g:solarized_contrast = "normal"
set background=dark
colorscheme solarized 
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
let g:NERDTreeWinSize = 20

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
\   'python': ['pylint', 'pycodestyle'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier-standard'],
\   'python': ['isort','yapf', 'autopep8'],
\}


"let g:ale_lint_on_text_changed = 0
"let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1


" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

" let g:ale_lint_delay= 1000
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python3'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" let g:syntastic_javascript_checkers = ['standard']
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1 
" let g:syntastic_check_on_wq = 0

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>




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


"ctrlp
let g:ctrlp_custom_ignore =  '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'  
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 1 

" Ultisnips
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


" AsyncRun
let g:asyncrun_open = 8

let g:livedown_open=1
