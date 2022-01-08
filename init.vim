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

" Python syntax
" NOTE: make sure that you run :UpdateRemotePlugins
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Git support
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

" Smart comments
Plug 'tpope/vim-commentary'

call plug#end()


" ##########[ SETUP EACH PLUGIN ]#############################################

"Gruvbox
colorscheme gruvbox
set background=dark

" ALE
let g:python3_host_prog='/home/mp/anaconda3/envs/nvim/bin/python'
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'python': ['pep8', 'pydocstyle', 'bandit', 'mypy'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\}

" Git support
let g:signify_sign_change = '~'
highlight SignifySignAdd    ctermfg=green  guifg=#00ff00
highlight SignifySignDelete ctermfg=red    guifg=#ff0000
highlight SignifySignChange ctermfg=yellow guifg=#ffff00

" ##########[ REMAPS ]########################################################

" VimRc
nnoremap <leader>lrc <cmd>source $MYVIMRC<cr><cmd>PlugInstall<cr>
nnoremap <leader>erc <cmd>tabnew $MYVIMRC<cr>

" Disable Ctrl + z as escape
nnoremap <c-z> <nop>

" Tabs
nnoremap <c-h> <cmd>tabprevious<cr>
nnoremap <c-l> <cmd>tabnext<cr>
nnoremap <c-n> :tabnew<space>

" NerdTree
nnoremap <c-t> <cmd>NERDTreeToggle<cr>

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

" Disable movement
nnoremap <left> <nop>
vnoremap <left> <nop>
inoremap <left> <nop>

nnoremap <right> <nop>
vnoremap <right> <nop>
inoremap <right> <nop>

nnoremap <up> <nop>
vnoremap <up> <nop>
inoremap <up> <nop>

nnoremap <down> <nop>
vnoremap <down> <nop>
inoremap <down> <nop>

nnoremap <pageup> <nop>
vnoremap <pageup> <nop>
inoremap <pageup> <nop>

nnoremap <pagedown> <nop>
vnoremap <pagedown> <nop>
inoremap <pagedown> <nop>

" Git support
" remap Git to git, because I'm lazy
cmap git Git


" ##########[ TODOS AND IDEAS ]###############################################

" Maybe pyling to ale linters only if a pylintrc
" file exists in the root of project
"
" And add a method to quickly iterate over all ALE warnings and errors
" for example clicking one button that gets us to next line with an error
"
" Add isort to python fixers
"
" Sessions in vim (when I come back I want to have the same files)
"
" Find a nice way of skipping a word to the end of the line: answer: A
"
" Remap smart comments to <c-/>
"
" consider using this https://github.com/lewis6991/gitsigns.nvim/ for git
