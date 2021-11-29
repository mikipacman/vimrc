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

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

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
nnoremap <leader>pi <cmd>PlugInstall<cr>
nnoremap <leader>sv <cmd>source $MYVIMRC<cr>

" Tabs
nnoremap <c-h> <cmd>tabprevious<cr>
nnoremap <c-l> <cmd>tabnext<cr>
nnoremap <c-n> :tabnew<space>

" NerdTree
nnoremap <c-t> <cmd>NERDTreeToggle<CR>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Stop highlighting text after search
nnoremap <leader><space> <cmd>noh<cr>

" TOP 5 VIM REMAPS BY PRIMEAGEN
" 5 Copying to the end of the line
nnoremap Y y$

" 4 Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" 3 Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap <space> <space><c-g>u

" 2 Jumplist mutations
noremap <expr> k (v:count > 5 ? "m'".v:count : "") . 'k'
noremap <expr> j (v:count > 5 ? "m'".v:count : "") . 'j'

" 1 Moving text
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
inoremap <c-j> <esc>:m .+1<cr>==
inoremap <c-k> <esc>:m .-2<cr>==
nnoremap <leader>j :m .+1<cr>==
nnoremap <leader>k :m .-2<cr>==

" ##########[ TODOS AND IDEAS ]###############################################

" Maybe pyling to ale linters only if a pylintrc
" file exists in the root of project
"
" And add a method to quickly iterate over all ALE warnings and errors
" for example clicking one button that gets us to next line with an error
"
" Add isort to python fixers
