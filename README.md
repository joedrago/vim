
On Windows:

* clone this to c:\work\vim
* install to c:\vim
* set env vars:
  * VIM=C:\work\vim
  * VIMRUNTIME=C:\vim\vim73
  * update PATH to have c:\vim\bin in it

On OSX / Linux:

* clone into ~/work/vim
* add to .profile
  * export PATH=$PATH:$HOME/work/vim/bin
* run:
  * ln -s work/vim/vimfiles .vim
  * ln -s work/vim/vimrc .vimrc

On Everything:

* install TTF fonts in /fonts
* in vim:
  * :helptags /path/to/vimfiles/doc
