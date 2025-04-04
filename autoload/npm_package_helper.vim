function! npm_package_helper#PackageInfoHelper()
: execute "normal! y"
: execute "normal! vi\"y"
: let l:pname = getreg('"')
: if !l:pname
    : execute "normal! y"
    : execute "normal! vi'y"
    : let l:pname = getreg('"')
: endif
: let l:urlCommand="curl -s \"https://registry.npmjs.com/-/v1/search?text=".(l:pname)."&size=1\""
: echo "Getting info for " . getreg('"'). ". Please wait while we get your package" 
: let l:vals = system(l:urlCommand)

: if empty(l:vals)
    : echo "--------------------------------"
    : echo "Package not found. Please check the package name."
    : echo "--------------------------------"
    : return
: endif

: let l:json_data = json_decode(l:vals)
: if empty(l:json_data)
    : echo "--------------------------------"
    : echo "Package not found. Please check the package name."
    : echo "--------------------------------"
    : return
:endif
: let l:data = l:json_data['objects'][0]
: let l:package = l:data['package']
: let l:installedVersion = system("npm list " . l:package['name'])
: let l:isInstalled = system("npm list " . l:package['name'] . " | grep -c '" . l:package['name'] . "'")
: let l:installedVersion = substitute(l:installedVersion, '.*' . l:package['name'] . '@', '', '')
: let l:installedVersion = substitute(l:installedVersion, '\n', '', '')
: let l:installedVersion = substitute(l:installedVersion, 'deduped', '', '')

: if l:package['name'] != l:pname
    : echo "--------------------------------"
    : echo "Package not found. Please check the package name."
    : echo "--------------------------------"
    : return
: endif

: unlet l:pname

" : if l:data['flags']['insecure']
" check if flags exists in dict, and check if insecure key exists
: if has_key(l:data['flags'], 'insecure') && l:data['flags']['insecure']
    : echo "--------------------------------"
    : echo "Security Warning: This package has been flagged for security issues."
    : echo "--------------------------------"
: endif
: echo "--------------------------------"
: echo "Package Name: " . l:package['name']
: if l:isInstalled && l:installedVersion
    : echo "Installed Version: " . l:installedVersion
: endif
: echo "Latest version: " . l:package['version']
: echo "--------------------------------"
: echo "Description: " . l:package['description']
: echo "--------------------------------"
: if has_key(l:package, 'maintainers') && len(l:package['maintainers']) > 0
    : echo "Maintainers: " . l:package['maintainers'][0]['username'] . " (" . l:package['maintainers'][0]['email'] . ")"
: endif
: if has_key(l:package, 'publisher') && len(l:package['publisher']) > 0
   : echo "Publisher: " . l:package['publisher']['username'] . " (" . l:package['publisher']['email'] . ")"
: endif
: echo "Last Updated: " . l:data['updated']
: echo "Downloads: Weekly - " . l:data['downloads']['weekly'] . ", Monthly - " . l:data['downloads']['monthly'] 
: echo "License: " . l:package['license']
: echo "--------------------------------"
: try
    : echo "Repository: " . l:package['links']['repository']
: catch
    : echo "Repository:"
: endtry
: try
    : echo "Homepage: " . l:package['links']['homepage']
: catch
    : echo "Homepage:"
: endtry
: try
    : echo "Bugs: " . l:package['links']['bugs']
: catch
    : echo "Bugs:"
: endtry
: try
    : echo "Npm: " . l:package['links']['npm']
: catch
    : echo "Npm:"
: endtry
: echo "--------------------------------"
: unlet l:urlCommand
: unlet l:vals
:endfunction
