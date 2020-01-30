## AdamUARK
## 2020 January 30 Thursday

## download IPEDS xlsx data from link below

## https://nces.ed.gov/ipeds/Search/ViewTable?tableId=5409&returnUrl=%2Fipeds%2FSearch%2FView%3FresultType%3Dtable%26query%3Dtenure%2520status%26page%3D1%26sortBy%3Drelevance

## UNCOMMIT TWO LINES BELOW | ONLY RUN FIRST TIME
# download.file('https://nces.ed.gov/ipeds/Search/DownloadTableLibraryTable?tableId=5409', 'tenure_states.xlsx', mode = "wb")
# install.packages("readxl")

## upload excel file
library(readxl)
usa_tenure <- read_xlsx("tenure_states.xlsx", skip = 2)


write.csv(usa_tenure, "usa_tenure.csv")
