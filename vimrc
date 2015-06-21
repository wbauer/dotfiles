"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set a map leader for more key combos
let mapleader = ','

set nocompatible " not compatible with vi
set encoding=utf-8

" Use before config if available {
    if filereadable(expand("~/.vimrc.before"))
        source ~/.vimrc.before
    endif
" }

" Use bundles config {
    if filereadable(expand("~/.vimrc.bundles"))
        source ~/.vimrc.bundles
    endif
" }

if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UI Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set title " set terminal title
"set so=7 " set 7 lines to the cursors - when moving vertical
set wildmenu              " enhanced command line completion
set wildmode=list:longest " complete files like a shell
set hidden                " current buffer can be put into background
set showcmd               " show incomplete commands
set noshowmode            " don't show which mode disabled for PowerLine
set scrolloff=3           " lines of text around cursor
set ttyfast               " faster redrawing
set t_Co=256
set cmdheight=1           " command bar height
"set shell=$SHELL

set autoread " detect when a file is changed

" backup/persistance settings
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*"
set backup
set writebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287

" persist (g)undo tree between sessions
set undofile
set history=256
set undolevels=256

" make backspace behave in a sane manner
set backspace=indent,eol,start
"set backspace=2   " Backspace deletes like most programs in insert mode
"set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
"set autowrite     " Automatically :write before running commands

" Softtabs, 4 spaces
set expandtab       " Tabs are spaces, not tabs
set smarttab        " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set shiftwidth=4    " Use indents of 4 spaces
set softtabstop=4   " Let backspace delete indent
set tabstop=4       " An indentation every four columns
set autoindent      " Indent at the same level of the previous line
set ruler           " show the cursor position all the time
set shiftround      " round indent to a multiple of 'shiftwidth'
set smartindent
set nojoinspaces    " Prevents inserting two spaces after punctuation on a join (J)
"set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
"set completeopt+=longest

" Searching
set ignorecase   " case insensitive searching
set smartcase    " case-sensitive if expresson contains a capital letter
set hlsearch     " Highlight search terms
set incsearch    " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

" Color scheme
syntax on
colorscheme solarized
set background=dark
"let g:airline_theme="powerlineish"
"let g:airline_theme="base16"

"execute "set background=".$BACKGROUND
"execute "colorscheme ".$THEME

" Highlight line number of where cursor currently is
"hi CursorLineNr guifg=#050505

set cursorline                  " Highlight current line

highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode

" Make it obvious where 120 characters is
set textwidth=120
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Treat <li> and <p> tags like the block tags they are
"let g:html_indent_tags = 'li\|p'

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
"set spellfile=$HOME/.vim-spell-en.utf-8.add

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => StatusLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2 " show the satus line all the time
" Broken down into easily includeable segments
"set statusline=%<%f\    " Filename
"set statusline+=%w%h%m%r " Options
"set statusline+=%{fugitive#statusline()} "  Git Hotness
"set statusline+=\ [%{&ff}/%Y]            " filetype
"set statusline+=\ [%{getcwd()}]          " current dir
"set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General mappings/shortcuts for functionality
" Additional, plugin-specific mappings are located under
" the plugins section

" reload ctags, --fields=+l needs by YCM
nnoremap <leader>C :!ctags -R --fields=+l --exclude=.git --exclude=log --exclude=tmp *<CR><CR>

" shortcut to save/write
nmap <leader>w :w<cr>

" open vimrc
nnoremap <leader>ev :e ~/.vimrc<CR>
nnoremap <leader>eV :tabnew ~/.vimrc<CR>
" edit vim plugins
nnoremap <leader>eb :e ~/.vimrc.bundles<CR>
nnoremap <leader>eB :tabnew ~/.vimrc.bundles<CR>
" edit vim local
nnoremap <leader>el :e ~/.vimrc.local<CR>
nnoremap <leader>eL :tabnew ~/.vimrc.local<CR>
" edit gitconfig
nnoremap <leader>eg :e ~/.gitconfig<CR>
nnoremap <leader>eG :tabnew ~/.gitconfig<CR>

" remove extra whitespace
nmap <leader><space> :%s/\s\+$<CR>

" toggle search highlighting
nmap <silent> <leader>/ :set invhlsearch<CR>

" toggle invisible characters
"set list listchars=tab:»·,trail:·,nbsp:·
"set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set listchars=tab:»·,trail:·,nbsp:·,eol:¬,extends:❯,precedes:❮
highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
set showbreak=↪
nmap <leader>l :set list!<CR>

" switch between current and last buffer
nmap <leader>. <c-^>

" Quicker window movement
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l

map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-l> :call WinMove('l')<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => COOL THINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --nogroup --column'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  "let g:ctrlp_use_caching = 0
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Local config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Local config if available {
  if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
  endif
" }