npm package info     
============

## Installation
Install using Vundle:  
```Plugin "https://github.com/whatever555/npm-package-info"```

  
## Usage 
Place cursor over a package name your package.json file and call `:PackageInfo`   

Plugin will display some info about the package. 
Info includes latest version, latest release date etc...
  
## Mapping examples  
To map `<leader>N` to `:PackageInfo` add the following to your `.vimrc` file:  
:nnoremap <leader>N :PackageInfo<CR>
   
     
To only allow it to run in package.json files:  
:autocmd FileType json nnoremap <leader>N :PackageInfo<CR>

  
  
## Screenshots  
Step 1: Put cursor over package name text
![screen 1](imgs/screen1.png?raw=true "Cursor over")

Step 2: In normal mode (`<Esc>`) type `:PackageInfo`
![screen 2](imgs/screen2.png?raw=true "Leader+N")
