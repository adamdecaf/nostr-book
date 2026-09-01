.PHONY: setup all epub pdf html

setup:
	@./scripts/setup.sh

all: epub pdf html

epub:
	@./scripts/create.sh epub

pdf:
	@./scripts/create.sh pdf

html:
	@./scripts/create.sh html
