#Scraping "paytm" Diwali best deals
#Keerthi SP(RA1811003020520)

# dependency to check access
library(robotstxt)
path <- paths_allowed ("https://paytmmall.com/mobiles-glpid-6224?use_mw=1&src=store&from=storefront")

#setting website url
url <-"https://paytmmall.com/mobiles-glpid-6224?use_mw=1&src=store&from=storefront"
#define(library)
library(dplyr)
library(rvest)

# defining url
web<- read_html(url)

#Automating data collection using pipeline
Name<-web%>%html_nodes(".UGUy")%>%html_text()
#scraps_name

Discount <-web%>%html_nodes(".dQm2")%>%html_text()
#scraps_discount

Price <-web%>%html_nodes("._2MEo")%>%html_text()
#scraps_price

Cashback <-web%>%html_nodes("._1mS1")%>%html_text()
#scraps_cashback

#making a table for collected entrie
Mobile_Offers<- data.frame(Name,Discount,Price,Cashback)
View(Mobile_Offers)


#saving the table as a csv file
write.csv(Mobile_Offers, "in paytm mall.csv")