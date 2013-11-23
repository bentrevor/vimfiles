call pathogen#infect()

""" settings """
""""""""""""""""
filetype on
filetype plugin on
filetype indent on
set nocompatible


set encoding=utf8
set termencoding=utf8

if &term == 'xterm' || &term == 'screen'
  set t_Co=256
endif

syntax on
set background=dark
color tomorrownight

set nobackup
set nowb
set noswapfile

set cmdheight=2 " Height of the command bar
set so=3 " keep three lines between cursor and top/bottom of window
set history=5000
set hid " A buffer becomes hidden when it is abandoned
set number " line numbers
set cursorline " highlight current line and line number
set expandtab " spaces instead of tabs
set showmatch " Show matching brackets when text indicator is over them
set showcmd " Show commands as they're typed
set mat=2 " How many tenths of a second to blink when matching brackets
set foldmethod=manual " don't fold text automatically
set nowrap " <leader>w to toggle
set laststatus=2 " Always show the status line

" when a search pattern is all lowercase, it is case-insensitive
" when a search pattern contains a capital, it is case-sensitive
set ignorecase
set smartcase
set hlsearch " highlight search results
set incsearch " execute search after each character is typed

" Backspace can delete newlines
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" unlimited characters per line
set lbr
set tw=0

" default to two spaces indentation
set tabstop=2
set shiftwidth=2

" filetype-specific indentation
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType css setlocal ts=2 sts=2 sw=2
autocmd FileType ruby setlocal ts=2 sts=2 sw=2
autocmd FileType clojure setlocal ts=2 sts=2 sw=2
autocmd FileType python setlocal ts=4 sts=4 sw=4
autocmd FileType java setlocal ts=4 sts=4 sw=4

" clojure filetype settings
autocmd FileType clojure setlocal lispwords+=describe,it,context,around
autocmd FileType clojure setlocal wildignore+=target/**/*
autocmd BufNewFile,BufRead *.hiccup set filetype=clojure
autocmd BufNewFile,BufRead *.cljs set filetype=clojure

" pressing tab in command shows options
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" " set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" map <silent> <LocalLeader>ws :highlight clear ExtraWhitespace<CR>




""" plugin stuff """
""""""""""""""""""""
" ignore patterns for nerdtree
let NERDTreeIgnore=['\~$', 'target', 'repl$', 'out$', 'bin$']

" open nerd tree
map <leader>nt :NERDTreeToggle<cr>

" resize nerd tree
map <leader>ns :vert<space>res<space>32<cr>

let g:CommandTMaxFiles=40000
map <leader>t :CommandTFlush<CR>:CommandT<CR>

let vimclojure#FuzzyIndent=1
let vimclojure#ParenRainbow=1




""" mappings """
""""""""""""""""
nnoremap ; :
nnoremap , ;

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Remap x to delete instead of cut
noremap x "_dl

" set * to not automatically jump to next word
nnoremap * ma*`a

" !! repeats last command
nnoremap !! @:<cr>

" unmap c-p, ex mode, F1 help,
inoremap <c-p> p
nnoremap Q <nop>
nmap <F1> <nop>
imap <F1> <nop>

" \h clears highlighting
nnoremap <leader>h :noh<cr>

" \w wraps highlighted text in parens
vnoremap <leader>w <Esc>`>a)<Esc>`<i(<Esc>

" \e evals clojure code with fireplace.vim
map <leader>e :Eval<cr>

" \ss shows the current syntax highlighting group
map <leader>ss :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

" comment
" \cr ruby
nnoremap <leader>cr maI#<space><esc>$`a
vnoremap <leader>cr 0I#<space><esc>
" \cj javascript
nnoremap <leader>cj maI//<esc>$`a
vnoremap <leader>cj 0I//<esc>
" \ch haskell
nnoremap <leader>ch maI--<esc>$`a
vnoremap <leader>ch 0I--<esc>
" \cc clojure
nnoremap <leader>cc maI;<space><esc>$`a
vnoremap <leader>cc 0I;<space><esc>

" uncomment (only works for single line)
nnoremap <leader>u $^xx$

" substitute text
map <leader>sa :%s//g<Left><Left>
map <leader>sv :s//g<Left><Left>

" delete trailing whitespace
nmap <leader><leader>w :%s/\s\+$//<cr>



""" settings mappings """
"""""""""""""""""""""""""
" <alt-w> toggles word wrap
map ∑ :set invwrap<CR>:set wrap?<CR>

" <alt-v> reloads vimrc
map √ :so $MYVIMRC<cr>

" <alt-=> aligns entire document
map ≠ mhggVG=`hzz

" <alt-r> reloads document
map ® :e<cr>zz

" <alt-l> toggles colored parens for lisp
map ¬ :RainbowParenthesesLoadRound<cr>:RainbowParenthesesActivate<cr>

" <alt-p> toggles paste mode
map π :set invpaste<CR>:set paste?<CR>


