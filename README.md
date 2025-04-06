# npm-package-info.vim 📦

A Vim plugin to fetch and display information about npm packages directly from your editor! 🚀

This plugin helps you quickly retrieve details like description, version, maintainers, and more for any npm package, making it super convenient to assess dependencies without leaving Vim.

## Features ✨

-   Fetches package information from the npm registry.
-   Displays package name, version, description, maintainers, and other relevant details.
-   Checks if the package is already installed and shows the installed version.
-   Provides links to the repository, homepage, bugs, and npm page of the package.
-   Shows weekly and monthly download counts.
-   Displays license information.
-   Warns about packages flagged for security issues.

## Screenshots  
![screen 1](imgs/screen1.png?raw=true "Cursor over")


## Installation 🛠️

### Using vim-plug

1.  Add the following line to your `~/.vimrc` or `~/.config/nvim/init.vim`:

    ```vim
    Plug 'whatever555/npm-package-info'
    ```

2.  Run `:PlugInstall` in Vim to install the plugin.

### Using Vundle

1.  Add the following line to your `~/.vimrc`:

    ```vim
    Plugin 'whatever555/npm-package-info'
    ```

2.  Run `:PluginInstall` in Vim to install the plugin.

### Using Pathogen

1.  Clone the repository into your `~/.vim/bundle` directory:

    ```bash
    git clone https://github.com/whatever555/npm-package-info.git ~/.vim/bundle/npm-package-info
    ```

2.  Add the following lines to your `~/.vimrc`:

    ```vim
    execute pathogen#infect()
    syntax on
    filetype plugin indent on
    ```

### Manual Installation
1.  Clone this repository to a directory of your choice.
2.  Create the required plugin directories.
    ```bash
    mkdir -p ~/.vim/plugin ~/.vim/autoload
    ```
3. Move the contents of the repository to the plugin directories you just created.

## Usage 🚀

0.  Open a `package.json` file in Vim.
1.  Place your cursor over your package of interest.
2.  Run the command

    ```vim
    :PackageInfo
    ```

    to display its information in the Vim command line.

## Customization ⚙️

Add the following keybindings to your `~/.vim/ftplugin/json.vim` for ease of use:

```vim
if exists(':PackageInfo') == 2
    nnoremap <buffer> <silent> <F1> :PackageInfo<CR>
    nnoremap <buffer> <silent> <C-F1> :<c-u>Open https://www.npmjs.com/package/<c-r><c-f>?activeTab=versions<CR>
endif
```

The latter mapping shows all its versions in your default browser.
