#' Write One Or More Time Series to the Time Series Archive
#' 
#' This function makes use of \code{\link{dbWriteTable}} to store 
#' one more time series and its meta information into a PostgreSQL 
#' database. This function is meant to bulk import new time series 
#' and its meta information. 
#' 
#' @param ts_keys character vector containing all series names.  
#' @param meta_env_name character name of the environment that stores the
#' metainformation
#' @author Matthias Bannert 
archive_new_ts <- function(ts_keys,meta_env_name="meta"){
  # define objects used in the entire function
  # status list for db interactions
  out <- list()
  
  ts_main <- create_db_table(ts_keys = ts_keys,meta_env_name = meta_env_name)
  # write main data to database
  out[[1]] <- dbWriteTable(con,"timeseries_main",ts_main,row.names=F,append=T)
  
  meta_localized <- create_db_table(ts_keys,type="meta",
                                    meta_env_name = meta_env_name)
  # write meta information to database
  out[[2]] <- dbWriteTable(con,"localized_meta_data",meta_localized,
                           row.names=F,append=T)
  
  names(out) <- c("Main data written successfully?",
                  "Localized Meta Information written successfully?")
  
  out
  
}