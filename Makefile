all:
	@git submodule update --init --recursive
	@git submodule foreach --recursive git pull origin master
	@sudo apt-get install -y ack-grep exuberant-ctags
	@sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep

install: clean
	ln -s $(CURDIR)/.vimrc $(HOME)/.

clean:
	rm -rf $(HOME)/.vimrc
