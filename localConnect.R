# packages
library(RPostgreSQL)

# works only within KOF!
drv <- dbDriver("PostgreSQL")
dbname <- "devseries"
dbuser <- "devbox"
dbhost <- "127.0.0.1"
dbport <- 5430
pw <- "tant00ine"

con <- dbConnect(drv, host=dbhost, port=dbport, dbname=dbname,
                 user=dbuser, password=pw)
