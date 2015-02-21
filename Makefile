install:
	cp ./config/.shrc              ~/
	cp ./config/.zshrc             ~/
	cp ./config/.vimrc             ~/
	cp ./config/.gitconfig         ~/

install-deb: install
	mkdir ~/.byobu
	cp ./config/.byobu/.tmux.conf  ~/.byobu/

install-bash: install
	cp ./config/.bash_profile      ~/
	cp ./config/.bashrc            ~/
