.vim
====

Vim settings

Requirements
============

* GIT

* Optional

    * Ack-grep

            sudo apt-get install ack-grep
            sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep

    * Ag

            sudo apt-get install silversearcher-ag

Instalation
===========

1. Clone this repository in your home dir.

        git clone git@github.com:7kfpun/.vim.git ~/.vim

2. Go to cloned directory and init submodules.

        cd ~/.vim && git submodule init && git submodule update

3. Install plugins.

        vim +NeoBundleInstall +qall

4. Enjoy your vim!

        source ~/.vim/.vimrc

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/7kfpun/.vim/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
