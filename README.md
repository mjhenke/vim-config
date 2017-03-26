# vim-config
A basic vim configuration for developers.  

* Automatically backs up your work on the fly
* Supports editing large files with swap space
* Improved window performance
* Emable mouse support and mouse popup
* Defaults to 80 col window and marks 80th column
* Uses [Tomorrow Theme](https://www.google.com) or default

## Installation
### Install Vim Configuration
```bash
$ mkdir -p ~/.vim
$ cd ~/.vim
$ git clone https://github.com/mjhenke/vim-config.git
```
### Install Link for Vim
A link is needed to the `vimrc` file to the default `~/.vimrc` to allow vim to use the new configuration.  If a `~/.vimrc` file already exists, then you should rename it or the following command will fail.
```bash
$ ln -s ~/.vim/vimrc ~/.vimrc
```
### Install PlugIn Manager
Vundle is used as the PlugIn manager and needs to be install before using this vimrc configuration.  To install Vundle follow the commands below.
```bash
$ cd ~/.vim/bundle
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
More detailed instructions can be found at Vundle GitHub repo: https://github.com/VundleVim/Vundle.vim.

### Install Color Scheme
```bash
$ cd ~/.vim/color
$ wget https://github.com/chriskempson/tomorrow-theme/blob/master/vim/colors/Tomorrow.vim
$ wget https://github.com/chriskempson/tomorrow-theme/blob/master/vim/colors/Tomorrow-Night-Bright.vim
```
More information on Tomorrow-Theme can be found at their GitHub repo: https://github.com/chriskempson/tomorrow-theme.git

## License
MIT

## Author Information
Michael Henke

## Feedback, bug-reports, requests, ...
Are welcome at https://github.com/mjhenke/vim-config/issues
