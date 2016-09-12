# Graham Place 
# 9/10/2016
# Zappos Data Science Analytics Challenge

# This R Script analyzes sales by platform

#imports
require(dplyr)
require(readr)
  
  #new df to hold avg_conversion_rate
  pf <- data.frame("platform" = levels(df$platform), gross_sales = 0, orders = 0, visits = 0)
  
  #calculate avg conversion rate per month
  for (c in pf[,1]) {
    sales = 0
    for(k in df[which(platform == c), 8]){
      sales <- sales + k
    }
    
    orders = 0
    for(l in df[which(platform == c), 7]){
      orders <- orders + l
    }
    
    visits = 0
    for(m in df[which(platform == c), 5]){
      visits <- visits + m
    }
    
    pf[which(platform == c),2] = sales
    pf[which(platform == c),3] = orders
    pf[which(platform == c),4] = visits
    
  }
  
  pf <- pf[-c(12,13),]
  
  orders_total <- sum(pf$orders)
  gross_sales_total <- sum(pf$gross_sales)
  visits_total <- sum(pf$visits)
  
  pf <- pf %>% mutate("orders_p" = 100*orders/orders_total, "gross_sales_p" = 100*gross_sales/gross_sales_total, "visits_p" = 100*visits/visits_total)
  
  
  write_csv(pf, "platform_data.csv")
  