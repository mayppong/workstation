install:
	cp ./.shrc              ~/
	cp ./.zshrc             ~/
	cp ./.vimrc             ~/

install-deb: install
	cp ./.byobu/.tumx.conf  ~/.byobu/

install-bash: install
	cp ./.bash_profile      ~/
	cp ./.bashrc            ~/
