# Graham Place 
# 9/10/2016
# Zappos Data Science Analytics Challenge

# This R Script analyzes bounce rate of our worst performer based on time 

#imports
require(dplyr)
require(lubridate)

#grab only observations from our highest bounce rate site
pinn <- df %>% filter(site == "Pinnacle")
pinn <- pinn %>% mutate(month = month(day))

#new df to hold avg_bounce_rate
monthly_bounce <- data.frame("month" = levels(pinn$month), avg_bounce = 0)

#calculate avg bounce rate per month
for (c in monthly_bounce$month) {
  temp <- pinn %>% filter(month == c, !is.nan(bounce_rate))
  monthly_bounce[which(monthly_bounce$month == c), 2] = mean(temp$bounce_rate) * 100
}

#vis time!
ggplot(monthly_bounce, aes(y = avg_bounce)) + 
  geom_point(aes(x = month)) + 
  scale_x_discrete(limits =  levels(pinn$month)) +
  labs(x = "Month", y = "Average Bounce Rate (%)", title = "Pinnacle's Bounce Rate by Month") +
  guides(fill = FALSE) +
  theme_minimal()



                  