SHELL=/bin/bash
static=$(CURDIR)/static
source=$(CURDIR)/src
pages=$(CURDIR)/pages

.PHONY: build serve

build: build-md
	@$(CURDIR)/build.sh

build-md:
	@npx markdown-it $(CURDIR)/src/iterative.md > $(CURDIR)/content/iterative.html
	@npx markdown-it $(CURDIR)/src/recursion.md > $(CURDIR)/content/recursion.html

serve:
	@$(CURDIR)/up.sh
