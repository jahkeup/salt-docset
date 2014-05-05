SALT_DOCS=salt/doc
SALT_DOCS_BUILD=salt/doc/_build/dirhtml
# SALT_DOCS_ICON=salt/doc/_static/salt-logo.svg
SALT_DOCS_ICON=salt/doc/_static/favicon.ico


DOCSET=$(shell pwd)/Salt.docset
DASH_DOCSETS_PATH=$(HOME)/Library/Application Support/Dash/DocSets
INSTALL_DOCSET=$(DASH_DOCSETS_PATH)/Salt/Salt.docset
RELEASE_DOCSET=Salt.docset-$(DOCSET_RELEASE)

QUIET=${2>&1 >/dev/null}

ICON=$(shell pwd)/icon/salt-icon
DOC2DASH=git+https://github.com/jahkeup/doc2dash.git@master

clean: cleanrelease
	rm -rf ${SALT_DOCS_BUILD}/../* ${QUIET}
	rm -rf ${DOCSET} ${QUIET}
	rm -rf ${ICON}{.png,@2x.png} ${QUIET}

icons: icon1x icon2x

icon1x: deps
	convert -resize 16x16 "${SALT_DOCS_ICON}" "${ICON}.png"

icon2x: deps
	convert -resize 32x32 "${SALT_DOCS_ICON}" "${ICON}@2x.png"

salt-docs: icons
	ls "${SALT_DOCS_BUILD}/genindex/index.html" || \
	(cd "${SALT_DOCS}" && make dirhtml)

docset: salt-docs
	doc2dash --name Salt --force "${SALT_DOCS_BUILD}" \
		 --icon "${ICON}.png"
	cp "${ICON}@2x.png" Salt.docset/icon@2x.png

add-docset:
	ls "$(DOCSET)" 2>&1 1>/dev/null || make docset
	mkdir -p "${DASH_DOCSETS_PATH}/Salt"
	cp -R "$(DOCSET)" "$(INSTALL_DOCSET)" && \
	open -a 'Dash.app' "$(INSTALL_DOCSET)"

deps:
	(which sphinx-build && which doc2dash) || pip install ${DOC2DASH} sphinx
	which convert || brew install imagemagick

release:
ifndef DOCSET_RELEASE
	$(error You must define a DOCSET_RELEASE when using 'make release')
endif
	$(shell date > release.log)
	tar -cvzf $(RELEASE_DOCSET).tar.gz Salt.docset 2>> release.log
	zip -v -r $(RELEASE_DOCSET).zip Salt.docset 1>> release.log

cleanrelease:
	rm $(RELEASE_DOCSET)*
