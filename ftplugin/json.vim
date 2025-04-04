if bufname('%') !~# 'package' | finish | endif

command! -buffer PackageInfo call npm_package_helper#PackageInfoHelper()

nnoremap <buffer> <silent> <F1> :PackageInfo<CR>
nnoremap <buffer> <silent> <C-F1> :<c-u>Open https://www.npmjs.com/package/<c-r><c-f>?activeTab=versions<CR>
