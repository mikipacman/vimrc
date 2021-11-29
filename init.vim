" ##########[ BASIC CONFIG ]##################################################

syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set nobackup
set undodir=~/.nvim/undodir
set undofile
set incsearch
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" ##########[ PLUG INSTALL ]##################################################

call plug#begin('~/.nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'

call plug#end()


" ##########[ SETUP EACH PLUGIN ]#############################################

"Gruvbox
colorscheme gruvbox
set background=dark

" ALE
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'python': ['pep8', 'pydocstyle', 'bandit', 'mypy'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black'],
\}


" ##########[ REMAPS ]########################################################

" VimRc
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Tabs
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-n> :tabnew<Space>

" NerdTree
nnoremap <C-t> :NERDTreeToggle<CR>

" ##########[ TODOS AND IDEAS ]###############################################
" Maybe pyling to ale linters only if a pylintrc
" file exists in the root of project
"
" And add a method to quickly iterate over all ALE warnings and errors
" for example clicking one button that gets us to next line with an error
"
" Add isort to python fixers
