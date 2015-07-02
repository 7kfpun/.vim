library:
	@sudo apt-get install -y ack-grep exuberant-ctags silversearcher-ag
	@sudo pip install isort
	@sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep

all: submodule install

submodule:
	@git submodule update --init --recursive

install: clean
	@vim +NeoBundleInstall +qall
	@ln -s $(CURDIR)/.vimrc $(HOME)/.

clean:
	rm -rf $(HOME)/.vimrc
