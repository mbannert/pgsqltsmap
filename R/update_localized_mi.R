#' Update Localized Meta Information in the Database
#' 
#' This function updates localized meta information in the database.
#' Either the entire localized meta information for one time series is
#' overwritten and replaced by the localized meta information in memory
#' or only added meta series that do not exist in the database are added. 
#' 
#' @param con A postgreSQL connection object
#' @param Obj character name of time series
#' @param meta_env_name 
#' @param overwrite logical should the localized meta information in memory overwrite
#' the complete local meta information for this time series in the database?
#' @author Matthias Bannert
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
      meta_localized <- create_db_table(mi_key,type="meta",
                                        meta_env_name = meta_env_name)
      
      meta_localized <- meta_localized[meta_localized$ts_language %in% not_in_db,]
      
      out[[4]] <- dbWriteTable(conn=con,"localized_meta_data",meta_localized,append=T,
                               row.names=F)
    }
    
    # 
    
    
    
  } else {
    stop("This series does not exist in the database. Meta information can't be
         updated.")
  }
  
  names(out) <- c("Is given key in the main database?",
                  "In case of overwrite: Are old series successfully deleted?",
                  "In case of overwrite: Are replacements successfully written?",
                  "Are missing localized series added successfully?")
  out
  
  }
