function! ProcessList(listToProcess, functionToCall)
    for fpath in a:listToProcess
            call {a:functionToCall}(fpath)
    endfor
endfunction

function! AddBundle(fpath)
    execute "Plug " . readfile(a:fpath, "", 4)[-1][1:]
endfunction

function! SourceFile(fpath)
    exe 'source' a:fpath
endfunction
