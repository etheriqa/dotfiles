.PHONY: update install uninstall symlink local vim anyenv brew

PREFIX:=$(HOME)

SYMLINKS:=\
    .ctags\
    .git_templates\
    .gitconfig\
    .gitignore\
    .gvimrc\
    .my.cnf\
    .rprofile\
    .tigrc\
    .tmux.conf\
    .vimrc\
    .zshenv.darwin\
    .zshenv.linux\
    .zshenv\
    .zshrc.darwin\
    .zshrc.linux\
    .zshrc\

LOCALS:=\
    .gitconfig.local\
    .vimrc.local\
    .zshenv.local\
    .zshrc.local\

FORMULAE:=\
    coreutils\
    ctags\
    fswatch\
    git\
    jq\
    macvim\
    parallel\
    tig\
    tmux\
    vim\
    watch\
    zsh\

.DEFAULT: update

update:
	git pull --rebase
	$(MAKE) symlink
	$(MAKE) local
	vim -c "silent NeoBundleUpdate" -c quit

install: symlink local vim anyenv

uninstall:
	rm -f $(foreach symlink,$(SYMLINKS),$(PREFIX)/$(symlink))
	rm -fr $(PREFIX)/.vim
	rm -fr $(PREFIX)/.anyenv

symlink:
	ln -fs $(foreach symlink,$(SYMLINKS),$(PWD)/$(symlink)) $(PREFIX)

local:
	touch $(foreach local,$(LOCALS),$(PREFIX)/$(local))
	grep "local colorcode=" $(PREFIX)/.zshenv.local > /dev/null || echo "local colorcode=nico" >> $(PREFIX)/.zshenv.local
	grep "set shell=" $(PREFIX)/.vimrc.local > /dev/null || echo "set shell=$$SHELL" >> $(PREFIX)/.vimrc.local

vim:
	mkdir -p $(PREFIX)/.vim/bundle
	mkdir -p $(PREFIX)/.vim/tmp
	git clone https://github.com/Shougo/neobundle.vim $(PREFIX)/.vim/bundle/neobundle.vim
	vim -c "silent NeoBundleInstall" -c quit

anyenv:
	git clone https://github.com/riywo/anyenv $(PREFIX)/.anyenv

brew:
	brew install $(FORMULAE)
