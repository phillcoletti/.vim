set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'    " Required that Vundle manage itself
"""""""""""""""""""""""""""""""""""""""""""""""
" BEGIN Plugins (managed by Vundle)
""""""""""""""""""""""""""""""""""""""""""""""
" Plugin 'tpope/vim-fugitive'
" Plugin 'L9'
Plugin 'tpope/vim-rails'			" rails plugin
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'		" directory tree on left sidebar
Plugin 'terryma/vim-multiple-cursors'		" Multiple Cursors
Plugin 'ervandew/supertab'		" Tab Completion
" Plugin 'lsdr/monokai' 			" Sublime default colorscheme
Plugin 'tomasr/molokai' 			" Sublime default colorscheme
Plugin 'kien/ctrlp.vim' 			" File search

"""""""""""""""""""""""""""""""""""""""""""""""
" END Plugins (managed by Vundle)
""""""""""""""""""""""""""""""""""""""""""""""
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","


""""""""""""""""""""""""""""""""""""""""""""""
"  Basic Vim Settings
"""""""""""""""""""""""""""""""""""""""""""""
set hidden        " keep buffer open when editing new file
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile
filetype plugin indent on    " indents based on filetype
if has('autocmd')            " Python specific indenting
	autocmd filetype python set expandtab
endif

""""""""""""""""""""""""""""""""""""""""""
" Editing Behavior
""""""""""""""""""""""""""""""""""""""""""
" visually indicate white spaces and mark end of lines
set list 
set listchars=tab:>.,trail:.,extends:#,nbsp:.
" don't show tabs in html and xml
if has('autocmd')            " Python specific indenting
	autocmd filetype html,xml set listchars-=tab:>.
endif
set pastetoggle=<F2>		" Toggle paste mode using F2
" Enforce 80 character line length
:set colorcolumn=80

""""""""""""""""""""
" Colorschemes
"""""""""""""""""""
set t_Co=256
"let g:solarized_termcolors=256
let g:rehash256 = 1
if &t_Co >= 256 || has("gui_running")
"	set background=dark
	colorscheme molokai
endif

" switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
	syntax on
endif

"""""""""""""""""""""""""""""""""""""""""
" Nerd Tree
" """"""""""""""""""""""""""""""""""""""
noremap <Leader>n :NERDTreeToggle<cr>		" Nerd tree shortcut
if has('autocmd')
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
endif
let NERDTreeDirArrows=0

""""""""""""""""""""""""
" CtrlP
" """"""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
