# Graham Place 
# 9/10/2016
# Zappos Data Science Analytics Challenge

# This R Script imports provided dataset and cleans it up a bit, creating an rdata 


#package imports
require(readr)
require(lubridate)
require(dplyr)

#import the data
df <- read_csv("zappos_data.csv")

#get rid of erroneous columns
df <- df[, which(colnames(df) != "NA")]


#Let's munge by variable!

#day
#time data is useless -- all 00:00, so let's get rid of it and make the year accurate so we can actually use R's date capabilities 
df$day <- gsub("/", "-", gsub("13$", "2013", gsub(" .*", "", df$day)))
df$day <- mdy(df$day)

#while we're at it, having the weekday may prove useful in our analysis, let's add that variable
df <- df %>% mutate(wday = wday(day, label = TRUE, abbr = FALSE))

#site
#6 levels, so this makes more sense as a factor than a char
df$site <- as.factor(df$site)

#new_customer
#decode, make factor
temp <- as.character(df$new_customer)
temp[which(df$new_customer == 1)] <- "new" 
temp[which(df$new_customer == 0)] <- "returning" 
temp[is.na(df$new_customer)] <- "neither" 
rm(temp)
df$new_customer <- as.factor(temp)

#platform
#also makes more sense as a factor 
df$platform <- as.factor(df$platform)

#visits 
df$platform <- as.factor(df$platform)

#distinct_sessions
#orders 
#gross_sales
#bounces
#add_to_cart
#product_page_views
#search_page_views
#these are perfect just the way they are :) 

save(df, file = "zappos_clean.RData")

