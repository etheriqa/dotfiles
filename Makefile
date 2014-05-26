.PHONY: update install uninstall dotfiles vim

DOTFILES:=\
    .ctags\
    .git_templates\
    .gitconfig\
    .gitignore\
    .gvimrc\
    .tigrc\
    .tmux.conf\
    .vimrc\
    .zshenv\
    .zshenv.darwin\
    .zshenv.linux\
    .zshrc\
    .zshrc.darwin\
    .zshrc.linux\

update:
	git pull --rebase

install: dotfiles vim

dotfiles:
	ln -Fs $(foreach dotfile,$(DOTFILES),$(PWD)/$(dotfile)) $(HOME)
	touch $(HOME)/.vimrc.local
	touch $(HOME)/.zshenv.local
	touch $(HOME)/.zshrc.local

vim:
	mkdir -p $(HOME)/.vim/bundle
	mkdir -p $(HOME)/.vim/tmp
	git clone https://github.com/Shougo/neobundle.vim $(HOME)/.vim/bundle/neobundle.vim

uninstall:
	rm -f $(foreach dotfile,$(DOTFILES),$(HOME)/$(dotfile))
	rm -fr $(HOME)/.vim
