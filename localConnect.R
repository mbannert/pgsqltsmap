# packages
library(RPostgreSQL)

# on your localhost
# set listen_addresses in postgresql.conf to '*'
# and add the according information right in pg_hba.conf.

drv <- dbDriver("PostgreSQL")
dbname <- "devseries"
dbuser <- "devbox"
dbhost <- "127.0.0.1"
dbport <- 5430


drv <- dbDriver("PostgreSQL")
dbname <- "time_series"
dbuser <- "mbannert"
dbhost <- "127.0.0.1"
dbport <- 5430



con <- dbConnect(drv, host=dbhost, port=dbport, dbname=dbname,
                 user=dbuser,
                 password="mbannert")







# .rs.askForPassword("enter pass for remote db")