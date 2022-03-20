" changing map to ,
let mapleader =","

" TODO: split this in different files maybe?

" automatic installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'lervag/vimtex'
	Plug 'preservim/nerdtree'
	Plug 'tpope/vim-commentary'
	Plug 'vim-airline/vim-airline'
	Plug 'vimwiki/vimwiki'
call plug#end()

"" BASICS
syntax on
set number relativenumber
set textwidth=80
set encoding=utf-8
set foldenable
set foldmethod=manual

" remapping esc
inoremap jk <Esc>

" automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e

"" FILETYPES
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
