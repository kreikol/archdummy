" Plugins - con vim-plug
call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    Plug 'chrisbra/csv.vim'
    Plug 'moll/vim-bbye' " cerrar buffer sin cerrar ventana
    Plug 'simeji/winresizer' " easy resize
    Plug 'junegunn/fzf.vim'
    Plug 'simnalamburt/vim-mundo'
call plug#end()

set clipboard+=unnamedplus

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Jumps 
"   g; - cambio anterior
"   g, - cambio siguiente
"   [m - hace el inicio de un método ([)
"   ]m - hace el final de un método (])

set noswapfile

" save undo trees in files
set undofile
set undodir=$HOME/.config/nvim/undo

" number of undo saved
set undolevels=10000
set undoreload=10000

set number
set relativenumber

" use 4 spaces instead of tab ()
" copy indent from current line when starting a new line

set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Show substitutios
set inccommand=nosplit

nnoremap <space> <nop>
let mapleader = "\<space>"

nnoremap <leader>bn :bn<cr> ;buffer next
nnoremap <leader>bp :bp<cr> ;buffer prev
nnoremap <leader>bd :Bdelete<cr> ;cerrar buffer sin cerrar la ventana
nnoremap <leader>tn gt ;new tab

" Guardar y salir
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>q! :q!<cr>

" Config for chrisbra/csv.vim
augroup filetype_csv
    autocmd! 

    autocmd BufRead,BufWritePost *.csv :%ArrangeColumn!
    autocmd BufWritePre *.csv :%UnArrangeColumn
augroup END

" Config for fzf.vim (BONUS :D)
nnoremap <leader>f :Files<cr>
