set nocompatible              " be iMproved, required

set number

filetype off                  " required

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall -sync | source $MYVIMRC
endif

 " ================ Plugins ================
 call plug#begin('~/.local/share/nvim/plugged')

 " NERDTree
 Plug 'preservim/nerdtree'
 Plug 'scrooloose/nerdtree-project-plugin'
 Plug 'sheerun/vim-polyglot'
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'itchyny/lightline.vim'
 Plug 'tpope/vim-fugitive'
 Plug 'vim-scripts/DoxygenToolkit.vim'
 Plug 'junegunn/fzf.vim'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

 " Git Gutter
 Plug'airblade/vim-gitgutter'

 " a.vim (switch between .cpp and hpp)
 Plug 'ericcurtin/CurtineIncSw.vim'
 call plug#end()            " required

 packadd termdebug
 " =========================================
 
 " =============== Configuration ============
 let g:lightline = {
       \ 'component_function': {
       \   'filename': 'LightlineFilename',
       \ }
       \ }
 
 function! LightlineFilename()
   let root = fnamemodify(get(b:, 'git_dir'), ':h')
   let path = expand('%:p')
   if path[:len(root)-1] ==# root
     return path[len(root)+1:]
   endif
   return expand('%')
 endfunction
 " ==========================================


 " ================ Shortcuts ================
 " NERDTree
 nnoremap <leader>n :NERDTreeFocus<CR>
 nnoremap <C-n> :NERDTree<CR>
 nnoremap <C-t> :NERDTreeToggle<CR>
 nnoremap <C-f> :NERDTreeFind<CR>
 " autocmd VimEnter * NERDTree

 " Git Gutter
 nnoremap <C-l> :GitGutterLineHighlightsToggle<CR>

 " CurtineIncSw
 map <F5> :call CurtineIncSw()<CR>

 " Terdebug
 :nnoremap <Leader>d :Termdebug<Space>

 " Refresh NerdTree
 nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

 " Doxygen comment generation
 nmap <Leader>c :Dox<CR>
 " ===========================================

 " Display
 syntax on
 set showmode

 set autoread
 set colorcolumn=120

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
 " - Use ^[ to jump back up the tag stack
 map <C-[> :pop<CR>
 " - Use Alt + ] to open the definition in a vertical split
 map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

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

 " FZF
 " https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko
 set grepprg=rg\ --vimgrep\ --smart-case\ --follow
 nnoremap <silent> <C-f> :Files<CR>
 nnoremap <silent> <leader>f :Rg<CR>
 nnoremap <silent> <Leader>g :Commits<CR>
