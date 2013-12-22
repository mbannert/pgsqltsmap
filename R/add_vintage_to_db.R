#' Archive a Vintage of an Existing Time Series
#' 
#' This function stores a vintage of an existing time series to the vintage
#' table of the Postgres database. It only works if a corresponding main time
#' series exists. The link to the timeseries is made by the attribute NOT
#' by the name of the time series. Hence, myseries_vintage and myseries have
#' the same mi_key attribute. Vintage series can be marked by
#' additional vintage_key.
#' 
#' @param con a Postgres Connection Object,
#' @param Obj character name of the time series that contains the vintage
#' information
#' @param ... optional arguments, namely vintage_key. Could change that to 
#' a fixed argument. 
#' @author Matthias Bannert
add_vintage_to_db <- function(con,Obj,...){
  # check whether is an Object or a character representation
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
  
  # output, check whether all calls worked
  out <- list()
  
  # check whether series exists in the database
  statement_key_exists <- paste("SELECT ts_key FROM timeseries_main WHERE ts_key='",
                                mi_key,"'",sep="")
  out[[1]] <- length(dbGetQuery(con,statement_key_exists)) != 0
  
  if(out[[1]]){
    # write appendix to 
    vintage_key = unlist(list(...))
    out[[2]] <- dbWriteTable(conn=con,"ts_vintages",
                             create_db_table(mi_key,"vintage",
                                             vintage_key = vintage_key),
                             append=T,row.names=F)
  } else {
    stop("Can't add a vintage, because the series you requested doesn't exist
         in the database.")
  }
  
  out
  
  
  }
