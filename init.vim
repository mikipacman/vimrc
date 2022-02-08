" ##########[ BASIC CONFIG ]##################################################

syntax on
set clipboard+=unnamedplus
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
set undodir=~/.nvim/undodir
set undofile
set incsearch
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" ##########[ PLUG INSTALL ]##################################################

call plug#begin('~/.nvim/plugged')

" Color scheme
Plug 'morhetz/gruvbox'

" Linters and fixers
Plug 'dense-analysis/ale'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" File tree explorer
Plug 'preservim/nerdtree'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Python syntax
" NOTE: make sure that you run :UpdateRemotePlugins
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" For cool bar at the bottom
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/vim-gitbranch'

" Comments
Plug 'scrooloose/nerdcommenter'

" Matching parenthesis
Plug 'jiangmiao/auto-pairs'

" Git
Plug 'airblade/vim-gitgutter'

" Distraction free vim
Plug 'junegunn/goyo.vim'

" Smooth scrooloose
Plug 'psliwka/vim-smoothie'

" Fancy start up page
Plug 'mhinz/vim-startify'


call plug#end()

" ##########[ SETUP EACH PLUGIN ]#############################################

" Gruvbox
colorscheme gruvbox
set background=dark

" Make neovim search things in python env
" let $PATH='/home/mp/anaconda3/envs/nvim/bin/:$PATH'
" let $VIRTUAL_ENV='/home/mp/anaconda3/envs/nvim/bin/python'

" ALE
let g:ale_fix_on_save = 1
let g:ale_linters = {
            \   'python': [ 'flake8', 'pydocstyle', 'bandit', 'mypy' ],
            \}
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'python': ['black', 'isort'],
            \}

" Deoplete
let g:deoplete#enable_at_startup = 1

" Displaying branch name and number of warning in lightline

let g:lightline = {}
let g:lightline.component_expand = {
            \  'linter_checking': 'lightline#ale#checking',
            \  'linter_infos': 'lightline#ale#infos',
            \  'linter_warnings': 'lightline#ale#warnings',
            \  'linter_errors': 'lightline#ale#errors',
            \  'linter_ok': 'lightline#ale#ok',
            \ }
let g:lightline.component_type = {
            \     'linter_infos': 'right',
            \     'linter_checking': 'right',
            \     'linter_warnings': 'warning',
            \     'linter_errors': 'error',
            \     'linter_ok': 'right',
            \ }
let g:lightline.component_function = {
            \   'gitbranch': 'gitbranch#name'
            \ }
let g:lightline.active = {
            \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
            \            [ 'lineinfo' ],
            \            [ 'percent' ],
            \            [ 'fileformat', 'fileencoding', 'filetype'] ],
            \  'left': [ [ 'mode', 'paste' ],
            \            [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
            \ }

" Git
set updatetime=100

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

" Goyo toggle
nnoremap <c-d> <cmd>Goyo<cr>

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


" ##########[ TODOS AND IDEAS ]###############################################

" Maybe pyling to ale linters only if a pylintrc
" file exists in the root of project
"
" And add a method to quickly iterate over all ALE warnings and errors
" for example clicking one button that gets us to next line with an error
"
" Sessions in vim (when I come back I want to have the same files)
"
" Remap smart comments to <c-/>
"
" consider using this https://github.com/lewis6991/gitsigns.nvim/ for git
"
" use LSP for autocompletion and go to
"
" figure out how to work with autocompletion
"
" add git branch integration
