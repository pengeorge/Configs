set nu
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set autoread
set encoding=utf-8
set laststatus=2

set cursorline
set cul

map <F6> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
nnoremap <silent> <F8> :TlistToggle<CR>
imap <F9> <Esc>:bp!<CR>
imap <F10> <Esc>:bn!<CR>
nnoremap <F9> :bp!<CR>
nnoremap <F10> :bn!<CR>
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"if has("cscope")
"  cs add cscope.out
"endif
"set cscopequickfix=s-,c-,d-,i-,t-,e-

set nocp
filetype plugin on

"set mouse=a

"""""""""""""""""""""""""""""""""""
"ctags设置
""""""""""""""""""""""""""""""""""""
set tags=~/.vim/cpp
set tags+=./tags,tags,../tags,../../tags
"智能补全ctags -R --c++-kinds=+p --fields=+iaS --extra=+q
"let OmniCpp_DefaultNamespaces = ["std"]
"let OmniCpp_GlobalScopeSearch = 1 " 0 or 1
"let OmniCpp_NamespaceSearch = 1 " 0 , 1 or 2
"let OmniCpp_DisplayMode = 1
"let OmniCpp_ShowScopeInAbbr = 0
"let OmniCpp_ShowPrototypeInAbbr = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_MayCompleteDot = 1
"let OmniCpp_MayCompleteArrow = 1
"let OmniCpp_MayCompleteScope = 1


" For Vundle
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
"
" My bundles here:
Bundle 'taglist.vim'
"Bundle 'c.vim'
"Bundle 'minibufexpl.vim'
Bundle 'grep.vim'
Bundle 'mru.vim'
Bundle 'comments.vim'

" original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non-GitHub repos
Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
" Bundle 'files:/User/xxx/path/to/plugin'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'

"Plug 'Valloric/YouCompleteMe', { 'for' : [ 'c', 'cpp' ], 'do': function('BuildYCM') }
autocmd! User YouCompleteMe call youcompleteme#Enable()
Bundle 'Valloric/ListToggle'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
""Bundle 'vim-scripts/AutoClose'
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
"Bundle 'bling/vim-bufferline'
Bundle 'kien/ctrlp.vim'

Bundle 'altercation/vim-colors-solarized'
Bundle 'morhetz/gruvbox'
" ...
"
filetype plugin indent on     " required!

au FileType python setl shiftwidth=2 tabstop=2

""""""""""syntastic""""""""""""
let g:syntastic_check_on_open = 0
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
"set error or warning signs
let g:syntastic_error_symbol = 'E'
let g:syntastic_warning_symbol = 'W'
"whether to show balloons
let g:syntastic_enable_balloons = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

""""""""""""YCM""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = '/home/kaldi/code/kaldi-trunk/src/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0 "Do not ask when starting vim
""""""""""YCM additional conf (Oct 4, 2014)"""""""""""""""
let mapleader = ","
nnoremap <leader>jd :YcmCompleter GoTo<CR>
"DefinitionElseDeclaration<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
let g:syntastic_always_populate_loc_list = 1

"""""""""" NERDtree settings"""""""""""""""
"let g:nerdtree_tabs_open_on_console_startup=1
"autocmd vimenter * NERDTree | wincmd p "auto open NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
let NERDTreeWinPos='left'
"""""""""" mini buffer navigator"""""""""""
"let g:miniBUfExplMapWindowNavVim=1
"let g:miniBufExplMapWindowNavArrows=1
"let g:miniBufExplMapCTabSwitchBufs=1
"let g:miniBufExplModSelTarget=1 
"let g:miniBufExplUseSingleClick=1

" Powerline
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#syntastic#enabled = 1
let g:airline_left_sep=' '
let g:airline_right_sep=' '
let g:airline_powerline_fonts = 0
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
let g:airline_theme='badwolf' "murmur

" Solarized color scheme
"let g:solarized_termcolors=256
"syntax enable
set background=dark
colorscheme gruvbox "solarized/peachpuff


"hi Comment ctermfg=blue
"hi Directory guifg=#FF0000 ctermfg=blue


" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif
