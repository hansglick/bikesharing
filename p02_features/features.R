# FEATURE HOLYDAY * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 


# FEATURE SOLEIL ELEVATION * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
system(command = "jupyter nbconvert --to script feature_solar_elevation.ipynb")
system(command = "/home/osboxes/anaconda3/envs/data/bin/python feature_solar_elevation.py")
dfsoleil = read.csv("soleil.csv",header = T,stringsAsFactors = F)
df = merge(df,dfsoleil,by="index",all.x = TRUE)

# FEATURE TENDANCE * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
stats_tendance = df %>%
  group_by(year,month) %>%
  summarise(mean_location = sum(count))
