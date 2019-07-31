library(ggplot2)
library(lubridate)
library(dplyr)
rm(list=ls())

# Import du .csv en vue d'explorer les données avec Shiny
df = read.csv(file = "df.csv",header = T,sep ="," ,stringsAsFactors = F)
df$datetime= strptime(df$datetime, "%Y-%m-%d %H:%M:%S",tz = "GMT")
# lapply(df,class)
# Verif : df[,c("datetime","datetime_new")]

# discret : season, holiday, workingday,weather,month,hour,day, year
df$season = as.factor(df$season)
df$holiday = as.factor(df$holiday)
df$workingday = as.factor(df$workingday)
df$weather = as.factor(df$weather)
df$month = factor(df$month,levels = c("January","February","March","April","May","June","July","August","September","October","November","December"))
df$hour = as.factor(df$hour)
df$day = factor(df$day,levels = c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"))
df$year = as.factor(df$year)
# levels(df$month) = c("January","February","March","April","May","June","July","August","September","October","November","December")
# levels(df$day) = c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")

# Sauvegarde du dataframe nettoyé
saveRDS(object = df,file = "df.rds")




#  LES FONCTIONS * * * * * * * * * * * * * * * * * * * * * * * * * * * * 

# Fonction qui dit si une variable est factorielle ou non
fun_is_factor = function(name_var){
  return(is.factor(df[[name_var]]))
}

# Fonction qui prend une variable 'text' et qui créer un graphique croisé avec la target
fun_build_2d_plot =function(df,name_var){
  
  # Quel est le format de la variable a plotter
  decision = fun_is_factor(name_var)
  
  # le cas ou la variable est catégorielle
  if (decision){
    
    mystats = df %>%
      group_by_(name_var) %>%
      summarise(count = sum(count))
    p<-ggplot(data=mystats, aes_string(x=name_var, y="count")) +
      geom_bar(stat="identity")
  } else { # le cas ou elle est continue
    p <- ggplot(df, aes_string(name_var, "count")) +
      geom_point() +
      stat_summary(fun.data=mean_cl_normal) +
      geom_smooth(method='lm') + ylim(c(0,max(df$count)))
  }
  
  return(p)
}
# test de la fonction
# fun_build_2d_plot(df,"season")





# Fonction qui filtre le dataframe en fonction d'une date de début et une date de fin
fun_filter_df = function(df,date_debut,date_fin){
  filter = df$datetime<=date_fin & df$datetime>=date_debut
  resultat = df[filter,]
  return (resultat)
}
# date_debut = as.Date("2011-06-22")
# date_fin = as.Date("2011-11-13")
# resultat = fun_filter_df(df,date_debut,date_fin)



