SHELL=/bin/bash
static=$(CURDIR)/static
source=$(CURDIR)/src
pages=$(CURDIR)/pages

.PHONY: build serve

build: clean
	@$(CURDIR)/build.sh

serve:
	@$(CURDIR)/up.sh
