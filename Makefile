.DEFAULT_GOAL = project_proposal.pdf

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