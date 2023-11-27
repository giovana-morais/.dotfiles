" enable true colors
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

" changing map to ,
let mapleader =","

" plugins
call plug#begin('~/.vim/plugged')
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/goyo.vim'
	Plug 'lervag/vimtex'
	Plug 'preservim/nerdtree'
	Plug 'sonph/onehalf', { 'rtp': 'vim' }
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
call plug#end()

"" basic settings
syntax enable
set t_Co=256
colorscheme onehalfdark

set encoding=utf-8
set foldenable
set foldmethod=manual
set noswapfile 			" no swap
set number relativenumber
set splitright			" new windows always right
set splitbelow			" new windows always below
set textwidth=80

" remapping esc
inoremap jk <Esc>

" automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e

" FILETYPES
" default 4 spaces per tab
set sw=4 ts=4 ai

" c files
autocmd FileType c set sw=8 ts=8 ai

" treat all .md files as markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
" format markdown elements
autocmd FileType markdown set conceallevel=2

" ============ vim-airline ==============
let g:airline_theme='onehalfdark'

" ============ NERDTree ==================
map <leader>n :NERDTreeToggle<CR>
" close vim if the only window is a nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" show hidden files
let NERDTreeShowHidden=1

" ============ fzf ====================
nmap <C-p> :Files<CR>
nmap <C-e> :Buffer<CR>
let g:fzf_action = {'ctrl-e': 'edit'}
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" ============= vimtex =====================
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_toc_enabled = 1
let g:vimtex_fold_enabled = 1

" ================ Goyo ====================
let g:goyo_width = 90
" ,g toggles Goyo
map <leader>g :Goyo \| set linebreak<CR>
