" see :h 'statusline'
" to preview the colors and their name,
" generate the highlight test file:
"       :so $VIMRUNTIME/syntax/hitest.vim
set statusline=
" prints the relative path of the file
" (use uppercase F for the absolute path)
set statusline+=\ %f
" shows the file type
set statusline+=\ %y
" shows the indicator [RO] if the file is readonly
set statusline+=\ %r
" shows if changes has been maded
set statusline+=\ %M
" align items to the right
set statusline+=%=
" displays column:line/total lines
set statusline+=\ %c:%l/%L
" displays the buffer number
set statusline+=\ (buf: 
set statusline+=\ %n)
