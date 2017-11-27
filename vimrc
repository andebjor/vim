" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" turn off bell
set vb t_vb=

" windows copy-paste stuff
set clipboard=unnamed

" options for Gundo
" let g:gundo_width=30
" let g:gundo_preview_bottom=1
" nmap <silent> <F2> :GundoToggle<CR>

" options for Taglist
" let g:Tlist_Close_On_Select=1

" set search path for tags
" set tags=./tags;/
" use alt+<left,right> for tag jumping
" map <M-Right> <C-]>
" map <M-Left>  <C-T>
" ask if there is more than one tag matching
nnoremap <C-]> g<C-]>

" ignore case in search if lower case is given
set ignorecase
set smartcase

" Use shift+tab to inverse tab
" for command mode
" nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>

" walk over folded lines
nmap <UP>   gk
nmap <DOWN> gj

" Show what line the cursor is at
set cursorline

" display whitespace by default
set listchars=trail:.,tab:>-
set list
" F9 toggles list
nmap <F9> :set invlist list?<CR>


" NERD comment config
let g:NERDSpaceDelims = 1
let g:NERDCreateDefaultMappings = 0
map <Leader>x  <plug>NERDCommenterToggle
map <Leader>cc <plug>NERDCommenterComment
map <Leader>cu <plug>NERDCommenterUncomment

" Copy and comment out a line
map <silent> <Leader>r :let b:tmp_col=col(".")<CR>yypk<Leader>xj:call cursor(0, b:tmp_col)<CR>i

" Fix whitespace around =+- and ,
vmap <silent> <F5> :s/\([^[:space:]]\)\([=+-]\)\([^[:space:]]\)/\1 \2 \3/eg<CR>gv:s/\([^[:space:]]\),\([^[:space:]]\)/\1, \2/eg<CR>
nmap <silent> <F5> gv:s/\([^[:space:]]\)\([=+-]\)\([^[:space:]]\)/\1 \2 \3/eg<CR>gv:s/\([^[:space:]]\),\([^[:space:]]\)/\1, \2/eg<CR>

" comment out a region with #if 0/#endif
" vmap <silent> <F4> DO#if 0<ESC>o#endif<ESC>P
" nmap <silent> <F4> ddO#if 0<ESC>o#endif<ESC>P

" comment out a region with #if 0/#endif, and add an empty #else clause
" vmap <silent> <S-F4> DO#if 0<ESC>o#else<CR>#endif<ESC>kP/#else<CR>:nohlsearch<CR>
" nmap <silent> <S-F4> ddO#if 0<ESC>o#else<CR>#endif<ESC>kP/#else<CR>:nohlsearch<CR>

" comment out a region with #if 0/#endif, and add an identical #else clause
" vmap <silent> <C-F4> DO#if 0<ESC>o#else<CR>#endif<ESC>kP/#else<CR>:nohlsearch<CR>p
" nmap <silent> <C-F4> ddO#if 0<ESC>o#else<CR>#endif<ESC>kP/#else<CR>:nohlsearch<CR>p
" temporary: add a special string
" vmap <silent> <C-F4> DO#if 0 // TODO: vector size<ESC>o#else<CR>#endif<ESC>kP/#else<CR>:nohlsearch<CR>p
" nmap <silent> <C-F4> ddO#if 0 // TODO: vector size<ESC>o#else<CR>#endif<ESC>kP/#else<CR>:nohlsearch<CR>p

" Not used anymore, using NERD instead
" "let g:EnhCommentifyRespectIndent = 'Yes'
" let g:EnhCommentifyPretty = 'Yes'
" " let g:EnhCommentifyUseBlockIndent = 'Yes'
" " let g:EnhCommentifyMultiPartBlocks = 'yes'
" " let g:EnhCommentifyCommentsOp = 'yes'


" highlight column 81 and above
let g:column_error = 0
function ToggleColumnError()
   if g:column_error == 1
      match
      let g:column_error = 0
      echo "Column error off"
   else
      match ErrorMsg '\%>80v.\+'
      let g:column_error = 1
      echo "Column error on"
   endif
endfunction

nmap <F6> :call ToggleColumnError()<CR>

" Taglist options
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_Use_SingleClick = 1
let Tlist_Sort_Type = "name"

set scrolloff=5
set nopaste
set pastetoggle=<F11>
nnoremap <silent> <F7> :nohlsearch<CR>
set shiftwidth=4        " Indentation width when using >> and << re-indentation
set expandtab           " Tabs are expanded to spaces
set tabstop=4

" Scrolling in insert mode
inoremap <C-e> <C-x><C-E>
inoremap <C-y> <C-x><C-Y>

" backup and swap files
set backupdir=/scratch/bjorn/vim/backup,./.backup,.
set directory=/scratch/bjorn/vim/swap,.
" persistent undo
set undodir=/scratch/bjorn/vim/undo
set undofile


source $VIMRUNTIME/macros/matchit.vim

" Enable auto highlight
" call AutoHighlightToggle()


" Set a nice color scheme
" syntax on
let g:solarized_visibility="high"
let g:solarized_italic=0
syntax enable
set background=dark
colorscheme solarized

" use american english by default
set spelllang=en_us

" Nice make wrapper
" :command -nargs=* Make make <args> | cwindow 3

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent " always set autoindenting on
if has("vms")
  set nobackup " do not keep a backup file, use versions instead
else
  set backup   " keep a backup file
endif
set history=50 " keep 50 lines of command line history
set ruler      " show the cursor position all the time
set showcmd    " display incomplete commands
set incsearch  " do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq
"map E gqip
map E gwip


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  "syntax on
  set hlsearch
endif

" mouse scrolling inside terminal/tmux
if !has("gui_running")
    set mouse=a
endif

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
" let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
" let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1

let g:airline#extensions#branch#enabled = 1

" Easy switching of buffers
nmap <Leader>1 :b1<CR>
nmap <Leader>2 :b2<CR>
nmap <Leader>3 :b3<CR>
nmap <Leader>4 :b4<CR>
nmap <Leader>5 :b5<CR>
nmap <Leader>6 :b6<CR>
nmap <Leader>7 :b7<CR>
nmap <Leader>8 :b8<CR>
nmap <Leader>9 :b9<CR>


" Tabular config
if exists(":Tabularize")
    nmap <Leader>t= :Tabularize /=<CR>
    vmap <Leader>t= :Tabularize /=<CR>
    nmap <Leader>t: :Tabularize /:\zs<CR>
    vmap <Leader>t: :Tabularize /:\zs<CR>
endif


" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text      setlocal textwidth=78

  autocmd FileType plaintex  setlocal textwidth=78
  autocmd FileType tex       setlocal textwidth=78
  autocmd FileType tex       setlocal nojoinspaces
  autocmd FileType mail      setlocal nojoinspaces

  autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

  augroup XML
    autocmd!
    autocmd FileType xml setlocal foldmethod=indent
  augroup END

  augroup markdown
    autocmd!
    autocmd FileType markdown setlocal textwidth=78 spell
  augroup END

  augroup gitcommit
    autocmd!
    autocmd FileType gitcommit setlocal spell
  augroup END

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set auto highlight on at startup
"   autocmd VimEnter * call AutoHighlightToggle()

endif " has("autocmd")
