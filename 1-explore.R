## 2020 January 31 Friday CST
## explore 2004 usa tenure status

library(tidyverse)
usa_tenure <- read_csv("2004_usa_tenure.csv")
## drop first column
usa_tenure <- select(usa_tenure, -X1)

usa_tenure %>%
  ggplot(aes(x = STATE, y = FT_T)) +
    geom_point()
    