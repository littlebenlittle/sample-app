SHELL=/bin/bash
build=$(CURDIR)/build

.PHONY: build serve

build: build-md
	@ if [ ! -d $(build) ]; then mkdir $(build); fi
	@BUILD=$(build) $(CURDIR)/build.sh

build-md:
	@npx markdown-it $(CURDIR)/src/iterative.md > $(CURDIR)/content/iterative.html
	@npx markdown-it $(CURDIR)/src/recursion.md > $(CURDIR)/content/recursion.html

serve:
	@$(CURDIR)/up.sh
