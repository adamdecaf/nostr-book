.PHONY: setup all epub pdf

setup:
	@./scripts/setup.sh

all: epub pdf

epub:
	@./scripts/create.sh epub

pdf:
	@./scripts/create.sh pdf
