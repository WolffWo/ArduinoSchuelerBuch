ALL_FIGURE_NAMES=$(shell cat flowDiagramm.figlist)
ALL_FIGURES=$(ALL_FIGURE_NAMES:%=%.pdf)

allimages: $(ALL_FIGURES)
	@echo All images exist now. Use make -B to re-generate them.

FORCEREMAKE:

include $(ALL_FIGURE_NAMES:%=%.dep)

%.dep:
	mkdir -p $(dir $@)
	touch $@ # will be filled later.

out/if.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "out/if" "\def\tikzexternalrealjob{flowDiagramm}\input{flowDiagramm}"

out/if.pdf: out/if.md5
out/ifelse.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "out/ifelse" "\def\tikzexternalrealjob{flowDiagramm}\input{flowDiagramm}"

out/ifelse.pdf: out/ifelse.md5
