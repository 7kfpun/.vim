ack:
	@sudo apt-get install -y ack-grep exuberant-ctags
	@sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep

all: submodule install

submodule:
	@git submodule update --init --recursive

install: clean
	@ln -s $(CURDIR)/.vimrc $(HOME)/.
	@vim +BundleInstall

clean:
	rm -rf $(HOME)/.vimrc
