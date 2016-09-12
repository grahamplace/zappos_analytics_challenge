# Graham Place 
# 9/10/2016
# Zappos Data Science Analytics Challenge

# This R Script calculates and visualizes the average bounce rate of each site across the entire year

#imports
require(dplyr)
require(ggplot2)

#new df to hold avg_bounce_rate
avg_bounce <- data.frame("site" = levels(df$site), avg_bounce = 0)

#calculate avg bounce rate
for (c in avg_bounce$site) {
  temp <- df %>% filter(site == c, !is.nan(bounce_rate))
  avg_bounce[which(avg_bounce$site == c), 2] = mean(temp$bounce_rate) * 100
}

#vis time!
ggplot(avg_bounce, aes(weight = avg_bounce, fill = avg_bounce)) + 
  geom_bar(aes(x = site)) + 
  labs(x = "Site", y = "Average Bounce Rate (%)", title = "Average Bounce Rate by Site") +
  guides(fill = FALSE) +
  theme_minimal()
 

