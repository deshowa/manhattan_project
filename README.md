# Doing Data Science- MSDS 6306-401
# In Class Assignment- Unit 3

# Group Members: John Blevins, Dennis Murray, Alex Deshowitz

## FILE DESCRIPTIONS

## Main Directory
	.gitignore.txt -> file containing hte git ignore strings for git to omit updates
	Main.bib -> file containing bibliography data
	Manhattan_project.Rproj -> manhattan project r-project file for this project
	packages.bib -> packages library
	paper_visualizations.Rmd -> rmarkdown file that read in and creates word doc (stored in papers directory) of all visuals in analysis
	slideshow.Rmd -> slide show of visuals from analysis
	Website.Rmd -> file that makes .html doc for the visuals from the analysis
	

## ANALYSIS Directory
	analysis.R -> file containing the r-code used to tidy up the data, and create visual representations
	
	### Data Subdirectory
		rollingsales_manhattan.csv -> Contains data for the burrough of Manhattan dowloaded on 5/23/16 from: http://www1.nyc.gov/home/search/index.page?search-terms=Rolling+sales+update

## PAPERS Directory
	###This directory contains the visuals and analysis commentary regarding the Manhattan housing data
	paper_meaningful_trends.txt -> file that contains an overview of the trends witnessed in the manhattan sales data
	Paper_visualization.docx -> word document containing the visuals associated with the analysis in "paper_meaningful_trends.txt"
	

## R-session info (to be added)

R version 3.3.0 (2016-05-03)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows >= 8 x64 (build 9200)

locale:
[1] LC_COLLATE=English_United States.1252  LC_CTYPE=English_United States.1252    LC_MONETARY=English_United States.1252
[4] LC_NUMERIC=C                           LC_TIME=English_United States.1252    

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] plyr_1.8.3   gdata_2.17.0

loaded via a namespace (and not attached):
[1] tools_3.3.0  Rcpp_0.12.5  gtools_3.5.0