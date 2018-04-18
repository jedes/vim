" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set backup		" keep a backup file
set history=500		" keep 500 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hlsearch		" Highlight all search matches

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

colorscheme darkblue
set background=dark



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces and we use real tabs...
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tab completion behavior
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmode=longest,list
set wildmenu

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

""""""""""""""""""""""""""""""""
" => Line numbers are always on
""""""""""""""""""""""""""""""""
set number relativenumber
set smartcase
set ignorecase

""""""""""""""""""""""""""""""""
" => Other mode settings
""""""""""""""""""""""""""""""""
set showmode
set shortmess+=I


""""""""""""""""""""""""""""""""
" => Other mode settings
""""""""""""""""""""""""""""""""
set guioptions-=T


"""""""""""""""""""""""""""""""""""""
" => Higlight cursor on current line
"""""""""""""""""""""""""""""""""""""
set cursorline

"""""""""""""""""""""""""""""""""""""
" => splits navigation
"""""""""""""""""""""""""""""""""""""
" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"""""""""""""""""""""""""""""""""""""
" => ctrl-s saves the file...
"""""""""""""""""""""""""""""""""""""
inoremap <c-s> <Esc>:w<CR>
nnoremap <silent> <c-s> :w<CR>

"""""""""""""""""""""""""""""""""""""
" => Show trailing whitespace
"""""""""""""""""""""""""""""""""""""
highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
map <Leader>x :%s/\s\+$//


"""""""""""""""""""""""""""""""""""""
" => Vundle-related stuff
"""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'Align'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'OmniCppComplete'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'nachumk/systemverilog.vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tomtom/tcomment_vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'python-mode/python-mode'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"""""""""""""""""""""""""""""""""""""
" => Airline configuration
"""""""""""""""""""""""""""""""""""""
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show buffer numbers
let g:airline#extensions#tabline#buffer_nr_show = 1

"""""""""""""""""""""""""""""""""""""""""
" => Ctrl-tab behavior to switch buffers
"""""""""""""""""""""""""""""""""""""""""
" Add keyboard shortcuts
map <C-Tab> :bn<CR>
map <C-S-Tab> :bp<CR>


"""""""""""""""""""""""""""""""""""""""""
" => OmniCppComplete stuff
"""""""""""""""""""""""""""""""""""""""""
" to rebuild ctags...
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"""""""""""""""""""""""""""""""""""""""""
" => Ctrl-P configuration
"""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 'wa'

"""""""""""""""""""""""""""""""""""""""""
" => ack.vim configuration
"""""""""""""""""""""""""""""""""""""""""
let g:ackprg = 'ag --vimgrep'

"""""""""""""""""""""""""""""""""""""""""
" => nerttree config
"""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
map <F2> :NERDTreeToggle<CR>



"""""""""""""""""""""""""""""""""""""""""
" => Maximize the vim window
"""""""""""""""""""""""""""""""""""""""""
if has ("win32")
	autocmd GUIEnter * simalt ~x	" Works on windows, harmless on X.
else
	autocmd GUIEnter * call system('wmctrl -i -b add,maximized_vert,maximized_horz -r '.v:windowid)
endif
