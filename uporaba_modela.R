library(ggplot2)
library(plotly)
library(scales)

rm(list=ls())


######## funkcije ########

source("funkcije_model20.R")

##########



#### dejanski podatki ####

file_url = "https://raw.githubusercontent.com/slo-covid-19/data/master/csv/stats.csv"

tdat = read.csv(file_url, header = TRUE, stringsAsFactors = FALSE)


tdat = tdat[5:nrow(tdat),]
tdat$date = as.Date(tdat$date)

sidat = data.frame(date = tdat$date, 
                   state.in_hospital = tdat$state.in_hospital, 
                   state.deceased.todate = tdat$state.deceased.todate,
                   state.icu = tdat$state.icu)

sidat = sidat[!is.na(sidat$date), ]





##### Nastavitev Beta #########

# to dobimo iz optimizacije na sledilnik covid19 podatke
Bt_min_skupaj = c(2.80, 1.63, 1.39, 1.15, 0.61, 0.61, 0.27, 0.23, 0.21, 0.20)

Bfun = Bt(120, Bt_min_skupaj)
# izris beta 
#plot(Bfun, type = "l", ylim =c(0,2))


######## izracun modela skupaj z dejanskimi podatki ########

model_data = izracun_modela_dejanski(Bfun, sidat)






###### izrisi ######################

datumi = model_data[model_data$skupine=="ICU", "datum"]
fix_param = fixed_model_parameters()

# izris poteka reprodukcijskega števila

Rdata = data.frame(datum = datumi, 
                   R = Bfun*fix_param$D_infectious)



### reprodukcijsko število ####

p2 = ggplot(Rdata, aes(x=datum)) +
  geom_line(aes(y=R), size=1.2) +
  scale_x_date(breaks = seq(min(Rdata$datum),max(Rdata$datum), 5),
               labels = format(seq(min(Rdata$datum),max(Rdata$datum), 5), "%y-%m-%d")) +
  
  scale_y_continuous(limits = c(0,4)) +
  
  ylab("reprodukcijsko število R") +
  
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45)) +
  theme(text = element_text(size=14))


ggplotly(p2) %>%
  config(displayModeBar = F) %>%
  layout(legend = list(orientation = "h", xanchor = "center", x = 0.5, yanchor = "top", y = -0.2)) %>%
  layout(paper_bgcolor='transparent') %>%
  layout(yaxis = list(hoverformat = '.1f'))



### izris grafov ####

point <- format_format(big.mark = " ", decimal.mark = ",", scientific = FALSE)

pg = ggplot(model_data, aes(x=datum)) +
  geom_line(aes(y = stevilo, color = skupine), size=1.2) +
  geom_bar(aes(y=dejansko, fill = skupine), stat="identity", position="dodge") +
  
  scale_y_continuous(labels = point) +
  scale_x_date(breaks = seq(min(model_data$datum),max(model_data$datum), 5),
               labels = format(seq(min(model_data$datum),max(model_data$datum), 5), "%y-%m-%d")) +
  
  scale_fill_manual(values=c("#ff9900", "#cc2900", "#8585ad")) + 
  scale_color_manual(values=c("#ff9900", "#cc2900", "#8585ad")) +
  
  ylab("število") +

  theme_bw() +
  theme(axis.text.x = element_text(angle = 45)) +
  theme(text = element_text(size=14))


ggplotly(pg) %>%
  config(displayModeBar = F) %>%
  layout(legend = list(orientation = "h", xanchor = "center", x = 0.5, yanchor = "top", y = -0.2)) %>%
  layout(paper_bgcolor='transparent') %>%
  layout(yaxis = list(hoverformat = '.1f'))


