" set gfn=MiscFixed\ Semi-Condensed\ 10
" set gfn=-misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso8859-1
" set gfn=MiscFixed13
" set gfn=Symbol

" turn off bell
set vb t_vb=

nmap <S-Insert> "*p
map! <S-Insert> <C-R><C-*>

" Options for menys and stuff
set go-=m
set go-=T
set go-=r
" set go+=l

" set lines=24
set lines=70
set columns=80

set guicursor=n-v-c-i-ci:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175,a:blinkon0

" DD/DD/DD background
" hi Normal                  guibg=#ffffff


" how to display whitespace
" highlight SpecialKey guifg=black guibg=green

if &diff
  let &columns = 275 + 2*&foldcolumn + 1
endif

" common viminfo file
set viminfo+=n~/.viminfo
