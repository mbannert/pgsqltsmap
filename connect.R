# packages
library(RPostgreSQL)

# works only within KOF!
drv <- dbDriver("PostgreSQL")
dbname <- "kofdb"
dbuser <- ""
dbhost <- ""
dbport <- 5432

con <- dbConnect(drv, host=dbhost, port=dbport, dbname=dbname,
                 user=dbuser, password=.rs.askForPassword("Please enter PostgreSQL password"))
