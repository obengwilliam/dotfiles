REPO_URL ?= https://github.com/obengwilliam/dotfiles.git

bootstrap:
	@chmod +x ./init_dotfile.sh
	@./init_dotfile.sh $(REPO_URL)

dry-run:
	@chmod +x ./init_dotfile.sh
	@./init_dotfile.sh --dry-run $(REPO_URL)
