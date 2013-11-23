# generate some ts with meta information
source("test.R")

# connect to local database
source("localConnect.R")


require(caroline)


archive_new_ts(c("CH.KOF.TEST.REGION.ZH.VAR1.ITEM1","ts2"))


update_localized_mi <- function(con,Obj,meta_env_name="meta",overwrite=F){
  # check Object
  if(is.character(Obj)){
    nm <- Obj
    Obj <- get(Obj)
  }
  mi_key <- attr(Obj,"mi_key")
  # throw an error if there is no key attribute
  if(is.null(mi_key)){
    stop_statement <- "There is no meta information attached to this key."
    stop(stop_statement)
  }
  
  # out list
  out <- list()
  
  # check if series exists in db
  statement_key_exists <- paste("SELECT ts_key FROM timeseries_main WHERE ts_key='",
                                mi_key,"'",sep="")
  out[[1]] <- length(dbGetQuery(con,statement_key_exists)) != 0
  
  if(out[[1]]){
    # get all languages that are available for this key
    # in the db
    statement_lang_in_db <- paste("SELECT ts_language FROM localized_meta_data ",
                                  "WHERE ts_key ='",mi_key,"'",sep="")
    lang_in_db <- dbGetQuery(con,statement_lang_in_db)
    
    # locally in R
    lang_in_mem <- ls(get(meta_env_name)[[mi_key]]$ts_localized_mi)
    
    # if overwrite is set to TRUE, the entire localized meta object is replaced
    # by the one that's stored in the r session for a particular object
    if(overwrite == T){
      del_statement  <- paste("DELETE FROM localized_meta_data WHERE ts_key='",
                              mi_key,"'",sep="")
      out[[2]] <- dbGetQuery(con,del_statement)
      out[[3]] <- dbWriteTable(con,"localized_meta_data",
                               create_db_table(mi_key,type="meta"),
                               append=T,row.names=F)
    } else {
      # if overwrite is FALSE only update those who are not in the database yet
      # in the 
      not_in_db <- lang_in_mem[!(lang_in_mem %in% t(lang_in_db))]
      
      cat("do nothing.")
    }
    
    # 
    
    
    
  } else {
    stop("This series does not exist in the database. Meta information can't be
         updated.")
  }
#   
#   
#   
#   lang_in_mem <- ls(get(meta_env_name)[[mi_key]]$ts_localized_mi)
#   
#   
#   
#   
#   statement_lang_in_db <- paste("SELECT ts_language FROM localized_meta_data ",
#                                 "WHERE ts_key = ",)
#   lang_in_db <- dbGetQuery(conn=con,paste("SELECT ")
  
  not_in_db
  
}

ts3 <- rnorm(1:200)
add_mi(ts3)


# shall we be able to update a particular language? by specifying??
tst <- update_localized_mi(con,CH.KOF.TEST.REGION.ZH.VAR1.ITEM1)

match(t(tst),c("de","en"))

t(tst) %in% c("de","en")




























create_db_table(c("CH.KOF.TEST.REGION.ZH.VAR1.ITEM1"),type="meta")

as.data.frame(test)








# write it to pgsql... gotta check if hstore does work... 
out <- archive_ts(CH.KOF.TEST.REGION.ZH.VAR1.ITEM1)
out <- archive_ts(ts2)
str(out)

str(data.frame(ts_key = "CH",ts_language = names(out),
           ts_labels = t(as.data.frame(out)),
    stringsAsFactors = F))



dbWriteTable(con,"localized_meta_data",out,row.names=F,append=T)

dbWriteTable(con,"timeseries_main",out,row.names=F,append=T)

# gotta check the wrap
create_hstore(meta$CH.KOF.TEST.REGION.ZH.VAR1.ITEM1$ts_localized_mi)

archive_ts(test)



attr(test,"mi_key")


#### turn data to hstore
data_hstore <- create_hstore(Obj)
### create data.frame with fixed information
ts_main <- data.frame(ts_key = mi_key,
                      ts_data = data_hstore,
                      md_frequency = get(meta_env_name)[[mi_key]]$ts_frequency,
                      md_generated_by = get(meta_env_name)[[mi_key]]$ts_edited_by,
                      md_generated_on = get(meta_env_name)[[mi_key]]$ts_edited_on,
                      md_legacy_key = get(meta_env_name)[[mi_key]]$ts_legacy_key,
                      md_source = get(meta_env_name)[[mi_key]]$ts_source,
                      md_notes = get(meta_env_name)[[mi_key]]$ts_comment,
                      md_restrictions = get(meta_env_name)[[mi_key]]$ts_restrictions)

# write ts data to table
out[[1]] <- dbWriteTable(con,"timeseries_main",ts_main,row.names=F,append=T)
out[[2]] <- "no localized meta information available."

# check whether localized meta information is available
if(length(ls(get(meta_env_name)[[mi_key]]$ts_localized_mi)) == 0 ){
  warning("No localized meta information available")
} else {
  
  # create data.frame for localized meta information
  meta_localized_hstore <- create_hstore(get(meta_env_name)[[mi_key]]$ts_localized_mi)
  # just got to add ts_key and language name to a data.frame
  meta_localized <- data.frame(ts_key = mi_key,
                               ts_language = names(meta_localized_hstore),
                               ts_labels = t(as.data.frame(meta_localized_hstore)),
                               stringsAsFactors = F
  )  
  # write meta information to database
  out[[2]] <- dbWriteTable(con,"localized_meta_data",meta_localized,row.names=F,append=T)
  
}


