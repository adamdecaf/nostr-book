.PHONY: setup epub pdf

setup:
	@./scripts/setup.sh

epub:
	@./scripts/create.sh epub

pdf:
	@./scripts/create.sh pdf
