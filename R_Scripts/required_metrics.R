# Graham Place 
# 9/10/2016
# Zappos Data Science Analytics Challenge

# This R Script imports cleaned dataset, and creates/adds required metrics, then overwrites csv

#package imports
require(readr)

#read in clean data -- called df in stored RData from munging
load("zappos_clean.RData")

df <- df %>% mutate(conversion_rate = orders/visits, bounce_rate = bounces/visits, add_to_cart_rate = add_to_cart/visits)

save(df, file = "zappos_clean.RData")
