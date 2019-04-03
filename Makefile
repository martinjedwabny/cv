.PHONY: src

CC = xelatex
SRC_DIR = src
CV_DIR = src/cv
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
COVER_DIR = src/coverletter

src: $(foreach x, coverletter cv, $x.pdf)

cv.pdf: $(CV_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(CV_DIR) $<

coverletter.pdf: $(COVER_DIR)/coverletter.tex
	$(CC) -output-directory=$(COVER_DIR) $<

clean:
	rm -rf $(SRC_DIR)/*.pdf
	rm -rf $(CV_DIR)/*.pdf
	rm -rf $(COVER_DIR)/*.pdf
