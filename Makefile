SALT_DOCS=salt/doc
SALT_DOCS_BUILD=salt/doc/_build/dirhtml
SALT_DOC_ICON=salt/doc/_static/salt-logo.svg

DOCSET_PATH=$(shell pwd)/Salt.docset
DOCSETS_PATH=$(HOME)/Library/Application\ Support/Dash/DocSets

ICON=$(shell pwd)/icon/salt-icon
DOC2DASH=git+https://github.com/jahkeup/doc2dash.git@master

icons: icon1x icon2x

icon1x: deps
	convert -resize 16x16 "${SALT_DOC_ICON}" "${ICON}.png"

icon2x: deps
	convert -resize 32x32 "${SALT_DOC_ICON}" "${ICON}@2x.png"

salt-docs: icons
	ls "${SALT_DOCS_BUILD}/genindex/index.html" || \
	(cd "${SALT_DOCS}" && make dirhtml)

docset: salt-docs
	doc2dash --name Salt --force "${SALT_DOCS_BUILD}" \
		 --icon " ${ICON}.png"
	cp "${ICON}@2x.png" Salt.docset/icon@2x.png

add-docset:
	file "$(DOCSET_PATH)" 1>/dev/null || make docset
	mkdir -p "${DOCSETS_PATH}/Salt"
	cp -R "$(DOCSET_PATH)" "$(DOCSETS_PATH)/Salt/Salt.docset"
	open -a 'Dash.app' $(DOCSETS_PATH)/Salt/Salt.docset

deps:
	(which sphinx-build && which doc2dash) || pip install ${DOC2DASH} sphinx
	which convert || brew install imagemagick

