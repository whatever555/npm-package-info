:function! PackageInfoHelper()
: execute "normal! y"
: execute "normal! vi\"y"
: let l:urlCommand="curl -s \"https://imaga.me/npm/?p=".(getreg('"'))."\""
: echo "getting info on " . getreg('"'). ". Please wait while we get your package!" 
: let l:vals = split(system(l:urlCommand), "||")
: for v in l:vals
:   echo v
: endfor
: unlet l:urlCommand
: unlet l:vals
:endfunction

:autocmd FileType json nnoremap <buffer> <leader>N :call PackageInfoHelper()<CR>
