options(stringsAsFactors=FALSE) # for compatibile code between us

library(tidyverse)


setwd("/bigDataNotBackedUp/comp4.3_tert8.ckcc.outlier_results")
up_outlier_files=list.files(, "outlier_results_")

outlierResults<-lapply(up_outlier_files, function(x) {
	read_tsv(x, col_types=cols()) %>% 
	add_column(sampleID=gsub("outlier_results_", "", x))
	}) 	%>% 
	bind_rows()

sampleColumn = outlierResults$sample
quantile(sampleColumn, c(.95))