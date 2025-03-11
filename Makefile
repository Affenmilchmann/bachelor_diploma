.DEFAULT_GOAL = project_proposal.pdf

PP_ROOT = ./project_proposal
D_ROOT = ./diploma

project_proposal.pdf: $(PP_ROOT)/project_proposal.tex $(PP_ROOT)/parts/*.tex
	mkdir -p $(PP_ROOT)/tmp
	xelatex -output-directory $(PP_ROOT)/tmp $<
	mv $(PP_ROOT)/tmp/$@ ./$@

diploma.pdf: $(D_ROOT)/diploma.tex $(D_ROOT)/parts/*.tex
	mkdir -p $(D_ROOT)/tmp
	xelatex -output-directory $(D_ROOT)/tmp $<
	mv $(D_ROOT)/tmp/$@ ./$@
	