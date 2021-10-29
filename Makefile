DOTFILES_EXCLUDES := .DS_Store .git .gitignore .gitmodules .travis.yml
DOTFILES_TARGET   := $(wildcard .??*) 
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

deploy:
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	@$(foreach val, $(wildcard ./scripts/deploy/*.sh), bash -c $(val);)


init:
	@bash ./scripts/init/init.sh
