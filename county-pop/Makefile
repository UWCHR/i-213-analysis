# Authors:     PN
# Maintainers: PN
# Copyright:   2021, UWCHR, GPL v2 or later
# =========================================
# i-213-analysis/county-pop/Makefile

.PHONY: all clean

all: output/county-pop.csv

clean: 
		-rm -r output/*

output/county-pop.csv: \
		src/county-pop.R
	Rscript \
        --vanilla $< \
		--output=$@
		
# done.
