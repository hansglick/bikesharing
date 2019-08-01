source("fun.R", encoding = "UTF-8")
df = readRDS(file = "df.rds")

all_var_names = names(df)
all_var_names = !all_var_names %in% c("count", "datetime")
all_var_names = names(df)[all_var_names]

time_series_graph = build_the_time_series()
