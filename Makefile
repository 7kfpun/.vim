library:
	@sudo apt-get install -y ack-grep exuberant-ctags silversearcher-ag
	@sudo pip install isort
	@sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep

all: install

install:
	ln -s $(CURDIR)/.vimrc $(HOME)/.
	vim +PlugInstall

clean:
	rm -rf $(CURDIR)/plugged
	rm -rf $(HOME)/.vimrc
