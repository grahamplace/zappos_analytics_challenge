# Graham Place 
# 9/10/2016
# Zappos Data Science Analytics Challenge

# This R Script calculates and visualizes the average conversion rate of each site across the entire year

#imports
require(dplyr)
require(ggplot2)

#new df to hold avg_conversion_rate
avg_conversion <- data.frame("site" = levels(df$site), avg_conversion = 0)

#calculate avg conversion rate
for (c in avg_conversion$site) {
  temp <- df %>% filter(site == c, !is.nan(conversion_rate))
  avg_conversion[which(avg_conversion$site == c), 2] = mean(temp$conversion_rate) * 100
}

#vis time!
ggplot(avg_conversion, aes(weight = avg_conversion, fill = avg_conversion)) + 
  geom_bar(aes(x = site)) + 
  labs(x = "Site", y = "Average Conversion Rate (%)", title = "Average Conversion Rate by Site") +
  guides(fill = FALSE) +
  theme_minimal()


