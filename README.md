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

#. Clone this repository in your home dir.

    git clone git@github.com:7kfpun/.vim.git ~/.vim

#. Go to cloned directory and init submodules.

    cd ~/.vim && git submodule init && git submodule update

#. Install plugins.

    vim +NeoBundleInstall +qall

#. Enjoy your vim!
    source ~/.vim/.vimrc
