set visualbell
" This must be first, because it changes other options as side effect
set nocompatible

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  "   " render properly when inside 256-color tmux and GNU screen.
  "     " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  "       set t_ut=
  "       endif
   set t_ut=
endif


" use vim-plug as manager
call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tomasr/molokai'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

let mapleader = ','
filetype plugin indent on
set pastetoggle=<F2>

nmap <silent> <leader>ev :e $MYVIMRC<CR>
set nowrap        " don't wrap lines 
set tabstop=4     " a tab is four spaces 
set backspace=indent,eol,start                     " allow backspacing over everything in insert mode 
set autoindent    " always set autoindenting on 
set copyindent    " copy the previous indentation on autoindenting 
set number        " always show line numbers 
set shiftwidth=4  " number of spaces to use for autoindenting 
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>' 
set showmatch     " set show matching parenthesis 
set ignorecase    " ignore case when searching 
set smartcase     " ignore case if search pattern is all lowercase,                     "    case-sensitive otherwise 
set smarttab      " insert tabs on the start of a line according to                     "    shiftwidth, not tabstop 
set hlsearch      " highlight search terms 
set incsearch     " show search matches as you type
set modeline            " Enable modeline.
set nobackup
set noswapfile
set number
syntax enable
set background=dark
colorscheme gruvbox
set laststatus=2
set mouse=a
set rnu

" Move lines using Alt + direcTION : see http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Use CTRL-S for saving, also in Insert mode 
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" reload vimrc on save - 
augroup myvimrc
au!
	au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" cd to the directory containing the file in the buffer
nmap <silent> \cd :lcd %:h<CR>  

" trick to sudo save
cmap w!! w !sudo tee % >/dev/null 

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" ctrlP
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>f :CtrlPMRUFiles<CR> " Open most recently used files

" NERDTree
nmap <F7>   :NERDTreeToggle<CR>             " Toggle the NERD Tree on an off with F7
nmap <S-F7> :NERDTreeClose<CR>              " Close the NERD Tree with Shift-F7
map \       :NERDTreeToggle<CR>
map \|      :NERDTreeFind<CR>               " Show current file

" airline

let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme= 'gruvbox'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
	  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>
