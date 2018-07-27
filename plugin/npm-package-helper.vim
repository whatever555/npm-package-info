:function! PackageInfoHelper()
: execute "normal! y"
: execute "normal! vi\"y"
: let l:pname = getreg('"')
: if !l:pname
    : execute "normal! y"
    : execute "normal! vi'y"
    : let l:pname = getreg('"')
: endif
: let l:urlCommand="curl -s \"https://imaga.me/npm/?p=".(PackageNameFix(l:pname))."\""
: unlet l:pname
: echo "Getting info for " . getreg('"'). ". Please wait while we get your package!" 
: echo ""
: let l:vals = split(system(l:urlCommand), "||")
: for v in l:vals
:   echo v
: endfor
: unlet l:urlCommand
: unlet l:vals
:endfunction

:command! PackageInfo call PackageInfoHelper()

function! PackageNameFix(input_string)
    let l:ret = substitute(a:input_string, ' ', '\1', '')
    let l:ret = substitute(l:ret, '\.', '\1', '')
    return l:ret
endfunction
