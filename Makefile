install:
	cp ./.shrc              ~/
	cp ./.zshrc             ~/
	cp ./.vimrc             ~/

install-deb: install
	mkdir ~/.byobu
	cp ./.byobu/.tmux.conf  ~/.byobu/

install-bash: install
	cp ./.bash_profile      ~/
	cp ./.bashrc            ~/
