let mapleader ="\<Space>"
" Automatically Install Plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

set number
set nocompatible
set backspace=2
syntax on
" Plug packages
call plug#begin('~/.vim/plugged')

Plug 'mbbill/undotree'

"Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'

" how tabs and trailing whitespace
set list
set listchars=tab:▸-,precedes:←,extends:→,nbsp:·,trail:•

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Autosave plugin
Plug 'vim-scripts/vim-auto-save'
" 4 spaces for indentation
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4


" Markdown syntax suppoer
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
" Add plugins to &runtimepath
call plug#end()

"
" Fuzzy Find
"
nnoremap <Leader>o :Files<cr>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>r :FilesMru<cr>
let g:fzf_files_options = '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

"Plug 'mbbill/undotree'
" Undo Tree
nnoremap <Leader>u :UndotreeToggle<CR>:UndotreeFocus <CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 2

" Autosave
let g:auto_save_silent = 1
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
autocmd BufNewFile,BufRead *.sls set syntax=yaml
" Persistent Undo

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif
