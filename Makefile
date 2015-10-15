PREFIX:=$(HOME)

DOTFILES:=\
    .ctags\
    .distillery\
    .gitconfig\
    .gitignore\
    .gvimrc\
    .my.cnf\
    .rprofile\
    .tigrc\
    .tmux.conf\
    .vimcoder/C++Makefile\
    .vimcoder/C++Template\
    .vimcoder/includes.h\
    .vimrc\
    .xvimrc\
    .zshenv.darwin\
    .zshenv.linux\
    .zshenv\
    .zshrc.darwin\
    .zshrc.linux\
    .zshrc\

LOCALFILES:=\
    .gitconfig.local\
    .vimrc.local\
    .zshenv.local\
    .zshrc.local\

.PHONY: dist dotfiles localfiles install vim

dist: dotfiles localfiles

dotfiles:
	@for dotfile in $(DOTFILES); do \
		directory=`dirname $(PREFIX)/$$dotfile`; \
		mkdir -pv $$directory; \
		ln -sfv $(PWD)/$$dotfile $$directory; \
	done

localfiles:
	@for localfile in $(LOCALFILES); do \
		touch $(PREFIX)/$$localfile; \
	done
	@grep "local colorcode=" $(PREFIX)/.zshenv.local > /dev/null || echo "local colorcode=nico" >> $(PREFIX)/.zshenv.local
	@grep "set shell=" $(PREFIX)/.vimrc.local > /dev/null || echo "set shell=$$SHELL" >> $(PREFIX)/.vimrc.local

install: dist vim

vim:
	mkdir -p $(PREFIX)/.vim/bundle
	mkdir -p $(PREFIX)/.vim/tmp
	git clone https://github.com/Shougo/neobundle.vim $(PREFIX)/.vim/bundle/neobundle.vim
	vim -c "silent NeoBundleInstall" -c quit
