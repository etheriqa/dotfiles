DOTFILES:=\
    ctags\
    distillery\
    gitignore\
    gvimrc\
    my.cnf\
    rprofile\
    sqliterc\
    tigrc\
    tmux.conf\
    vimcoder/C++Makefile\
    vimcoder/C++Template\
    vimcoder/includes.h\
    xvimrc\

.PHONY: help
help:
	@echo "  install   ... deploy dotfiles at $(HOME)"
	@echo "  uninstall ... remove symlinks from $(HOME)"

.PHONY: install
install: \
	$(HOME)/.profile \
	$(HOME)/.bash_profile \
	$(HOME)/.bashrc \
	$(HOME)/.zprofile \
	$(HOME)/.zshrc \
	$(HOME)/.gitconfig \
	$(HOME)/.vimrc \
	$(HOME)/.vim \
	
	@for dotfile in $(DOTFILES); do \
		directory=`dirname $(HOME)/.$$dotfile`; \
		mkdir -pv $$directory; \
		ln -sfv $(PWD)/$$dotfile $(HOME)/.$$dotfile; \
	done

.PHONY: uninstall
uninstall:
	@for dotfile in $(DOTFILES); do \
		rm -frv $(HOME)/.$$dotfile; \
	done

$(HOME)/.profile:
	echo ". $(PWD)/profile\nexport ENV=$(PWD)/rc" > $@

$(HOME)/.bash_profile:
	echo ". $(PWD)/profile\n. $(PWD)/rc" > $@

$(HOME)/.bashrc:
	echo ". $(PWD)/rc" > $@

$(HOME)/.zprofile:
	echo ". $(PWD)/profile" > $@

$(HOME)/.zshrc:
	echo "colorcode=nico\n. $(PWD)/zshrc" > $@

$(HOME)/.gitconfig:
	echo "[include]\n\tpath = $(PWD)/gitconfig" > $@

$(HOME)/.vimrc:
	echo "set shell=$$SHELL\nsource $(PWD)/vimrc" > $@

$(HOME)/.vim:
	mkdir -p $(HOME)/.vim/bundle
	mkdir -p $(HOME)/.vim/tmp
	git clone https://github.com/Shougo/neobundle.vim $(HOME)/.vim/bundle/neobundle.vim
	vim -c "silent NeoBundleInstall" -c quit
