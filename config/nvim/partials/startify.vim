autocmd BufEnter * if line2byte('.') == -1 && len(tabpagebuflist()) == 1 | Startify | endif

let g:startify_change_to_dir = 0 
