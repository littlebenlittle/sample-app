SHELL=/bin/bash
static=$(CURDIR)/static
source=$(CURDIR)/src
pages=$(CURDIR)/pages

.PHONY: build serve

build: clean
	@mkdir -p $(static)/js
	@rsync -rv $(source)/ $(static)/js
	@rsync -rv $(pages)/ $(static)

clean:
	@if [ -d $(static) ]; then rm -r $(static); fi

serve:
	@miniserve --index index.html $(static)
