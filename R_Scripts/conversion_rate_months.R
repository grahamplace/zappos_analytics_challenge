# Graham Place 
# 9/10/2016
# Zappos Data Science Analytics Challenge

# This R Script analyzes conversion rate of name over time 

#imports
require(dplyr)
require(lubridate)

conversion_rate <- function(name){
  #grab only observations from our highest conversion rate site
  site <- df %>% filter(site == name)
  site <- site %>% mutate(month = month(day, label = TRUE))
  
  #new df to hold avg_conversion_rate
  monthly_conversion <- data.frame("month" = levels(site$month), avg_conversion = 0)
  
  #calculate avg conversion rate per month
  for (c in monthly_conversion$month) {
    temp <- site %>% filter(month == c, !is.nan(conversion_rate))
    monthly_conversion[which(monthly_conversion$month == c), 2] = mean(temp$conversion_rate) * 100
  }
  
  #vis time!
  ggplot(monthly_conversion, aes(y = avg_conversion)) + 
    geom_point(aes(x = month)) + 
    scale_x_discrete(limits =  levels(site$month)) +
    labs(x = "Month", y = "Average Conversion Rate (%)", title = paste(name, "Conversion Rate by Month")) +
    coord_cartesian(ylim = c(0, 100)) +
    guides(fill = FALSE) +
    theme_minimal()
}
  

