
" An example for a vimrc file.
"
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2002 May 28
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"         for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"       for OpenVMS:  sys$login:.vimrc


" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" turn off bell
set vb t_vb=

" windows copy-paste stuff
set clipboard=unnamed

" load all plugins as bundles
" call pathogen#infect()

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

" ignore case in search if lower case is given
set ignorecase
set smartcase

" Use shift+tab to inverse tab
" for command mode
" nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>

" display whitespace by default
" set list

" NERD comment config
let g:NERDSpaceDelims = 1

" Copy and comment out a line
map <silent> <Leader>r :let b:tmp_col=col(".")<CR>yypk<Leader>xj:call cursor(0, b:tmp_col)<CR>

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


nmap <F9> :set invlist list?<CR>

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

"let g:EnhCommentifyRespectIndent = 'Yes'
let g:EnhCommentifyPretty = 'Yes'
" let g:EnhCommentifyUseBlockIndent = 'Yes'
" let g:EnhCommentifyMultiPartBlocks = 'yes'
" let g:EnhCommentifyCommentsOp = 'yes'

" nnoremap <silent> <F8> :TlistToggle<CR>
" let Tlist_Exit_OnlyWindow = 1
" let Tlist_Use_Right_Window = 1
" let Tlist_Use_SingleClick = 1
" let Tlist_Sort_Type = "name"

set scrolloff=5
set nopaste
set pastetoggle=<F11>
nnoremap <silent> <F7> :nohlsearch<CR>
set shiftwidth=4        " Indentation width when using >> and << re-indentation
set expandtab           " Tabs are expanded to spaces
set tabstop=4

" backup and swap files
set backupdir=/scratch/bjorn/vim/backup,./.backup,.
set directory=/scratch/bjorn/vim/swap,.
" persistent undo
set undodir=/scratch/bjorn/vim/undo
set undofile


source $VIMRUNTIME/macros/matchit.vim

" Enable auto highlight
" call AutoHighlightToggle()

" syntax on
syntax enable
set background=dark
colorscheme solarized

" use american english by default
set spelllang=en_us

" Nice make wrapper
" :command -nargs=* Make make <args> | cwindow 3

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent		" always set autoindenting on
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq
"map E gqip
map E gwip

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  "syntax on
  "colorscheme murphy
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  autocmd FileType plaintex setlocal textwidth=78
  autocmd FileType tex setlocal textwidth=78
  autocmd FileType tex setlocal nojoinspaces
  autocmd FileType mail setlocal nojoinspaces

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
