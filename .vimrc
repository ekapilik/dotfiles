" http://tnerual.eriogerg.free.fr/vimqrc.html
"
" Cheat sheet ^^^^^
"
" Eric Kapilik .vimrc
" Last updated 05/06/2020
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible				" Don't worry about vi compatibility
filetype off                    " required for Vundle (?)

" automatically install the plugin manager if it's not there
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'preservim/nerdtree'
Plugin 'rhysd/vim-clang-format'

" All of your plugins must be added before the following line.
call vundle#end() " required
filetype plugin indent on " required

" Turn on syntax highlighting
syntax on
set showmode

set autoread					" Detect when a file is changed
set colorcolumn=80				" 80 character limit reminder

" Preserve transparent background
hi Normal guibg=NONE ctermbg=NONE

set number relativenumber		" Show line numbers
set encoding=utf-8				" Encoding

" Searching
set ignorecase
set smartcase
set showmatch
set hlsearch
set incsearch

" Line wrapping
set wrap
set linebreak

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
map <leader>l :set list!<CR>

" Show trailing whitespace and spaces for tabs
map <leader>L /\s\+$<CR>

" Navigating Tabs
" New WinMove function may replace these
map <leader>p :tabp<CR>
map <leader>n :tabn<CR>
map <leader>t :tab split +Explore<CR>
map <leader>T :Explore<CR>

" Tab Character Spacing
set tabstop=4
set shiftwidth=4
set expandtab

" Quick Insertion
nnoremap <Space> i_<Esc>r

" HTML autocomplete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" Kernel-style C
autocmd FileType c call SetKernelRules()
function SetKernelRules()
    set tabstop=8
    set softtabstop=8
    set shiftwidth=8
    set noexpandtab
endfunction

" Set number lines on
set number

" Status Line
set laststatus=2                               " always show status line
set statusline=%<%f\                           " Filename
set statusline+=%w%h%m%r                       " Options
set statusline+=\ [%{&ff}/%Y]                  " filetype
set statusline+=\ [%{split(getcwd(),'/')[-1]}] " current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%        " Right aligned file nav info
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Windows / GVim
" set expandtab
" filetype plugin indent on
" set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Functions                                    "
"                                                                             "
" WinMove from https://github.com/nicknisi/vim-workshop/                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" start NERDTree automatically
au VimEnter * NERDTree
" Toggle NERDTree
nmap <F6> :NERDTreeToggle<cr>
" Focus to NERDTree
nmap <F4> :NERDTreeFind<cr>

" Tab cycle
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-n> :tabnew<CR>

set fdm=syntax
set foldlevelstart=20
set noeb vb t_tb=

" Clang-format
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

map <C-f> :ClangFormat<CR>
