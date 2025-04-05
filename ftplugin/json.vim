if bufname('%') !~# 'package' | finish | endif

command! -buffer PackageInfo call npm_package_helper#PackageInfoHelper()
