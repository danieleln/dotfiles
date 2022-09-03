" reloading the init.vim
nnoremap <c-s> :w<cr>:source ~/.config/nvim/init.vim<CR>

" faster way to change mode to normal
inoremap jj <Esc>

" disable arrows, enter and backspace in insert mode
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <down> <nop>
inoremap <up> <nop>
inoremap <enter> <nop>
inoremap <backspace> <nop>
inoremap <c-bs> <nop>

" use Y to copy the rest of the line starting
" from the cursor position (like D, C)
nnoremap Y y$

" faster way to enter Vifm (file manager)
" nnoremap <space> :EditVifm .<cr>

" faster way to enter Goyo
nnoremap <enter> :Goyo<cr>

" moving lines up and down in Visual Line Mode
xnoremap K :move '<-2<cr>gv-gv
xnoremap J :move '>+1<cr>gv-gv
