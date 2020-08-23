set nocompatible

set visualbell " stop beeping at me
set noeb vb t_vb= " Disable beep and white flash on error
set number "turn on line numbers
set backspace=indent,eol,start " normal backspace
filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting enabled

" FZF fuzzy finder 
set rtp+=/usr/local/opt/fzf
" Find files
nnoremap <silent> <C-p> :Files<CR>
" Find in files
nnoremap <silent> <Space>f :Rg<CR> 

" tabs and spaces 
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab " spaces instead of tabs
set smarttab " tab key inserts tab stops, backspace deletes tabs
set autoindent " match indents on new lines
set smartindent

" disable backups and swapfiles
set nobackup 
set nowritebackup
set noswapfile

" don't have to press shift for command mode
nnoremap ; :
vnoremap ; :

" set the mapleader 
let mapleader=" "

" Visual line navigation (for when lines wrap)
set virtualedit+=block " allow cursor to go anywhere in visual block mode
noremap j gj
noremap k gk

" Easier split navigation 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open splits to the bottom and the right
set splitbelow
set splitright

" Netrw 
let g:netrw_winsize=20
nnoremap <leader>n :Lexplore<CR> " toggle on the left of the editor

" Emmet 
let g:user_emmet_leader_key=',' " redefine the trigger to ',,'

" Quickly edit .vimrc in a split
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Quickly source .vimrc
:nnoremap <leader>sv :source $MYVIMRC<cr>
let g:tex_flavor = "latex"
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" conceal (mostly used for LaTeX
set conceallevel=2
let g:tex_conceal="abdgm"
