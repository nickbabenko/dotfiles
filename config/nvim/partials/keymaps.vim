" Map save to Ctrl + S
map <C-s> :w<CR>
imap <-s> <C-o>:w<CR>
nnoremap <Leader>s :w<CR>

" Save and close;s
nnoremap <Leader>x :x<CR>

" Quit
nnoremap <Leader>q :q<CR>

" fugitive git bindings
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gpl :Gpull<CR>
nnoremap <Leader>gps :Gpush<CR>


