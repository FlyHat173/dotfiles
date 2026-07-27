" vim plug
call plug#begin('~/.vim/plugged')

" List your plugins here
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'prettier/vim-prettier'
Plug 'jiangmiao/auto-pairs'
Plug 'ghifarit53/tokyonight-vim'

call plug#end()



" Set theme

set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight



" configuration for nerdtree

" close/open nerdtree with ctrl+n 
nnoremap <C-n> :NERDTreeToggle<CR>

" auto open nerdtree when open vim without any file
"autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" terminal will close vim if nerdtree is final window
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | quit | endif

" Show hidden icons (dotfiles)
let NERDTreeShowHidden=1

" don't show files/foldes not necessary
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node_modules', '\.git$']

" width nerdtree window
let g:NERDTreeWinSize=30

" show line in NERDTree
let NERDTreeShowLineNumbers=1

" auto close nerdtree when open a file
let NERDTreeQuitOnOpen=1

" Vim auto refresh when there are changes outside of Vim
let NERDTreeAutoDeleteBuffer=1

" auto open nerdtree when open a folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif



