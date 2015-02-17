install:
	cp ./.shrc              ~/
	cp ./.zshrc             ~/
	cp ./.vimrc             ~/

install-deb: install
	cp ./.byobu/.tmux.conf  ~/.byobu/

install-bash: install
	cp ./.bash_profile      ~/
	cp ./.bashrc            ~/
