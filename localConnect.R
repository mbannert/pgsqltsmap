# packages
library(RPostgreSQL)

# read the blog entry on 
# learnfrominfo.tumblr.com to 
# figure out how to run and connect
# a postgreSQL database on your local 
# virtual box ubuntu
drv <- dbDriver("PostgreSQL")
dbname <- "devseries"
dbuser <- "devbox"
dbhost <- "127.0.0.1"
dbport <- 5430
pw <- .rs.askForPassword

con <- dbConnect(drv, host=dbhost, port=dbport, dbname=dbname,
                 user=dbuser, password=pw)
