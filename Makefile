.PHONY: update install uninstall dotfiles vim anyenv

PREFIX:=$(HOME)

DOTFILES:=\
    .ctags\
    .git_templates\
    .gitconfig\
    .gitignore\
    .gvimrc\
    .my.cnf\
    .tigrc\
    .tmux.conf\
    .vimrc\
    .zshenv.darwin\
    .zshenv.linux\
    .zshenv\
    .zshrc.darwin\
    .zshrc.linux\
    .zshrc\

update:
	git pull --rebase
	vim -c "silent NeoBundleUpdate" -c quit

install: dotfiles vim anyenv

dotfiles:
	ln -Fs $(foreach dotfile,$(DOTFILES),$(PWD)/$(dotfile)) $(PREFIX)
	touch $(PREFIX)/.gitconfig.local
	touch $(PREFIX)/.vimrc.local
	touch $(PREFIX)/.zshenv.local
	touch $(PREFIX)/.zshrc.local

vim:
	mkdir -p $(PREFIX)/.vim/bundle
	mkdir -p $(PREFIX)/.vim/tmp
	git clone https://github.com/Shougo/neobundle.vim $(PREFIX)/.vim/bundle/neobundle.vim
	vim -c "silent NeoBundleInstall" -c quit

anyenv:
	git clone https://github.com/riywo/anyenv $(PREFIX)/.anyenv

uninstall:
	rm -f $(foreach dotfile,$(DOTFILES),$(PREFIX)/$(dotfile))
	rm -fr $(PREFIX)/.vim
	rm -fr $(PREFIX)/.anyenv
