## 2020 January 31 Friday CST
## explore 2004 usa tenure status

library(tidyverse)
usa_tenure <- read_csv("2004_usa_tenure.csv")
## drop first column
usa_tenure <- select(usa_tenure, -X1)

usa_tenure %>%
  ggplot(aes(x = STATE, y = FT_T, color = FT_TT)) +
    geom_point()
    

usa_tenure %>% arrange(desc(FT_T)) %>%
  head() %>%
  ggplot(aes(x = STATE, y = FT_T)) +
    geom_point()

qplot(x = STATE, y = FT_T, color = FT_TT, data = usa_tenure, geom = "point")

qplot(x = FT_T, color = FT_TT, data = usa_tenure, geom = "bar")

## normalize
## are states replacing tenure with TT at the rate they are loosing them?
usa_tenure %>% 
  mutate(T2TT = FT_T/FT_TT) %>%
  arrange(desc(T2TT)) %>%
  view()
  
usa_tenure %>% 
  mutate(TTT2NTT = (FT_T+FT_TT)/FT_NTT) %>%
  arrange(desc(TTT2NTT)) %>%
  view()
