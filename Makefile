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
ALL_TEX = $(D_ROOT)/diploma.tex 
ALL_TEX += $(D_ROOT)/parts/*.tex
ALL_TEX += $(D_ROOT)/parts/4_methods/*.tex

diploma.pdf: $(ALL_TEX)
	mkdir -p $(D_ROOT)/tmp
	xelatex -shell-escape -output-directory $(D_ROOT)/tmp $<
	mv $(D_ROOT)/tmp/$@ ./$@

diploma_bib: diploma.pdf
	biber $(D_ROOT)/tmp/diploma