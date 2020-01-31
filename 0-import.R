## AdamUARK
## 2020 January 30 Thursday

## download IPEDS xlsx data from link below

## https://nces.ed.gov/ipeds/Search/ViewTable?tableId=5409&returnUrl=%2Fipeds%2FSearch%2FView%3FresultType%3Dtable%26query%3Dtenure%2520status%26page%3D1%26sortBy%3Drelevance

## UNCOMMIT TWO LINES BELOW | ONLY RUN FIRST TIME
# download.file('https://nces.ed.gov/ipeds/Search/DownloadTableLibraryTable?tableId=5409', 'tenure_states.xlsx', mode = "wb")
# install.packages("readxl")

## upload excel file
library(readxl)
## skip the first 3 rows which say:
## National Center for Education Statistics
## Number of faculty in Title IV institutions, by full- and part-time status, tenure status, and state: Fall 2004
usa_tenure <- read_xlsx("tenure_states.xlsx", skip = 3)
## skip 3 and the first 4 columns are "Full-time facult~"
## the last 4 columns are "Part-time facul~"
usa_tenure
library(tidyverse)
## rename all the columns
colnames(usa_tenure) <- c("STATE", "FT_TOT", "FT_T", "FT_TT", "FT_NTT", "PT_TOT", "PT_T", "PT_TT", "PT_NTT")

## drop na removes blank rows and last 2 row, foot notes
usa_tenure <- drop_na(usa_tenure)
## drop columns with totals
usa_tenure <- select(usa_tenure, -FT_TOT, -PT_TOT)
## drop first row with total usa
usa_tenure <- usa_tenure[2 : nrow(usa_tenure),]
write.csv(usa_tenure, "2004_usa_tenure.csv")
