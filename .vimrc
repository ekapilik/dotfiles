set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim

" " ================ Plugins ================
 call vundle#begin()
 " Plugin manager
 Plugin 'VundleVim/Vundle.vim'

 " NERDTree
 Plugin 'preservim/nerdtree'
 Plugin 'scrooloose/nerdtree-project-plugin'
 Plugin 'sheerun/vim-polyglot'
 Plugin 'Xuyuanp/nerdtree-git-plugin'
 Plugin 'itchyny/lightline.vim'

 " Git Gutter
 Plugin 'airblade/vim-gitgutter'

 " a.vim (switch between .cpp and hpp)
 Plugin 'ericcurtin/CurtineIncSw.vim'
 call vundle#end()            " required

 " =========================================

 " ================ Shortcuts ================
 " NERDTree
 nnoremap <leader>n :NERDTreeFocus<CR>
 nnoremap <C-n> :NERDTree<CR>
 nnoremap <C-t> :NERDTreeToggle<CR>
 nnoremap <C-f> :NERDTreeFind<CR>
 autocmd VimEnter * NERDTree

 " Git Gutter
 nnoremap <C-l> :GitGutterLineHighlightsToggle<CR>

 " CurtineIncSw
 map <F5> :call CurtineIncSw()<CR>
 " ===========================================


 " Indentation
 filetype plugin indent on    " required
 set expandtab
 set tabstop=2
 set softtabstop=2
 set shiftwidth=2

 " FINDING FILES:
 " Search down into subfolders
 " Provides tab-completion for all file related tasks
 set path+=**
 set wildmenu
 " - Hit tab to :find by partial match
 " - Use * to make it fuzzy
 " - :b lets you autocomplete any open buffer

 " TAG JUMPING:
 " Create the `tags` file (may need to install ctags first)
 command! MakeTags !ctags -R .
 " - Use ^] to jump to tag under cursor
 " - Use g^] for ambiguous tags
 " - Use ^t to jump back up the tag stack

 " AUTOCOMPLETE:
 " - ^x^n for JUST this file
 " - ^x^f for filenames (works with our path trick!)
 " - ^x^] for tags only
 " - ^n for anything specified by the 'complete' option
 " - use ^n and ^p to go back and forth in completion list

 " FILE BROSWING:
 " Tweaks for browsing
 let g:netrw_banner=0        " disable annoying banner
 let g:netrw_browse_split=4  " open in prior window
 let g:netrw_altv=1          " open splits to the right
 let g:netrw_liststyle=3     " tree view
 let g:netrw_list_hide=netrw_gitignore#Hide()
 let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
 " - :edit a folder to open a file browser
 " - <CR>/v/t to open in an h-split/v-split/tab
 " - check |netrw-browse-maps| for more mappings

 " Switch between Vim window splits easily
 nmap <silent> <A-Up> :wincmd k<CR>
 nmap <silent> <A-Down> :wincmd j<CR>
 nmap <silent> <A-Left> :wincmd h<CR>
 nmap <silent> <A-Right> :wincmd l<CR>

 set encoding=utf8
