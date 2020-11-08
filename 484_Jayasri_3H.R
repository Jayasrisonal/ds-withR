#Scraping "paytmmall" Diwali best deals

# dependency to check access
library(robotstxt)
path <- paths_allowed ("https://paytmmall.com/Kurtis_Kurta_Sets-llpid-206474?use_mw=1&src=store&from=storefront&page=1&price=1000%2C6349")

#setting website url
url <-"https://paytmmall.com/Kurtis_Kurta_Sets-llpid-206474?use_mw=1&src=store&from=storefront&page=1&price=1000%2C6349"
#define(library)
library(dplyr)
library(rvest)

# defining url
web<- read_html(url)

#Automating data collection using pipeline
Name<-web%>%html_nodes(".UGUy")%>%html_text()
#scraps_name

Price <-web%>%html_nodes("._2MEo")%>%html_text()
#scraps_offers

Discount <-web%>%html_nodes(".c-ax")%>%html_text()
#scraps_discount

#making a table for collected entries
Diwali_Offer<- data.frame(Name,Price, Discount)
View(Diwali_Offer)


#saving the table as a csv file
write.csv(Diwali_Offer, "in paytm mall.csv")


