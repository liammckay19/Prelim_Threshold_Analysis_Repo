options(stringsAsFactors=FALSE) # for compatibile code between us

library(tidyverse)


setwd("~/Documents/UCSC/Junior/Treehouse/Prelim_Threshold_Analysis_Repo/comp4.3_tert8.ckcc.outlier_results")
# up_outlier_files=list.files(, "outlier_results_")

# outlierResults<-lapply(up_outlier_files, function(x) {
# 	read_tsv(x, col_types=cols()) %>% 
# 	add_column(sampleID=gsub("outlier_results_", "", x))
# 	}) 	%>% 
# 	bind_rows()

up_outlier_files_small = list.files(, "outlier_results_TH01_0053_S01") 
# so my computer can handle the data set faster for initial testing
outlierResultsSmall <- lapply(up_outlier_files, function(x) {
	read_tsv(x, col_types=cols()) %>% 
	add_column(sampleID=gsub("outlier_results_TH01_0053_S01", "", x))
	}) 	%>% 
	bind_rows()

df1 <- outlierResultsSmall %>% 
    select(Gene, sample) %>%
    filter(sample > 0.0) %>% #filter out outliers that are 0.0

