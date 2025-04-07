.DEFAULT_GOAL = diploma.pdf

####################
# Project proposal #
####################
PP_ROOT = ./project_proposal

project_proposal.pdf: $(PP_ROOT)/project_proposal.tex $(PP_ROOT)/parts/*.tex
	mkdir -p $(PP_ROOT)/tmp
	xelatex -output-directory $(PP_ROOT)/tmp $<
	mv $(PP_ROOT)/tmp/$@ ./$@

project_proposal_bib: project_proposal.pdf
	biber $(PP_ROOT)/tmp/project_proposal

###########
# Diploma #
###########
D_ROOT = ./diploma

diploma.pdf: $(D_ROOT)/diploma.tex $(D_ROOT)/parts/*.tex
	mkdir -p $(D_ROOT)/tmp
	xelatex -output-directory $(D_ROOT)/tmp $<
	mv $(D_ROOT)/tmp/$@ ./$@

diploma_bib: diploma.pdf
	biber $(D_ROOT)/tmp/diploma