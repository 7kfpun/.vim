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

    * jshint, less

            sudo npm install -g jshint less

Instalation
===========

1. Clone this repository in your home dir.

        git clone git@github.com:7kfpun/.vim.git ~/.vim

2. Go to cloned directory and init submodules.

        cd ~/.vim && git submodule update --init --recursive

3. Install plugins.

        vim +NeoBundleInstall +qall

4. Enjoy your vim!

        source ~/.vim/.vimrc
