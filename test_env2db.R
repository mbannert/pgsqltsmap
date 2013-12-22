rm(list=ls())
# assume we got an environment full of time series that needs to be written to 
load("data/time_series.RData")



env2data.table("time_series_export")

