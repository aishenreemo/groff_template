ASSET_DIST := ./assets_dist
HEADER := ./include
ASSET := ./assets
DIST := ./dist
SRC := ./src

HEADERS := $(wildcard $(HEADER)/*.ms)
TARGETS := $(patsubst $(SRC)/%.ms,$(DIST)/%.pdf,$(wildcard $(SRC)/*.ms))
ASSETS := $(patsubst $(ASSET)/%,$(ASSET_DIST)/%.pdf,$(wildcard $(ASSET)/*))

IGNORED_TARGETS := $(patsubst ignore/%.ms,$(DIST)/%.pdf,$(wildcard ignore/*.ms))

.PHONY: clean

all: $(ASSETS) $(TARGETS) $(IGNORED_TARGETS)

$(DIST) $(ASSET_DIST):
	mkdir -p $@

$(ASSET_DIST)/%.pdf: $(ASSET)/% | $(ASSET_DIST)
	convert $< $(ASSET_DIST)/temp.tiff
	tiff2pdf $(ASSET_DIST)/temp.tiff > $@

$(DIST)/%.pdf: $(SRC)/%.ms $(ASSETS) $(HEADERS) | $(DIST) $(ASSET_DIST)
	eqn -Tpdf $< | groff -U -P-e -tbl -Tpdf -ms > $@

$(DIST)/%.pdf: ignore/%.ms $(ASSETS) $(HEADERS) | $(DIST) $(ASSET_DIST)
	eqn -Tpdf $< | groff -U -P-e -tbl -Tpdf -ms > $@

clean:
	rm -rf $(DIST) $(ASSET_DIST)
