#' Store Boots Objects to PostgreSQL Time Series Database
#'
#' This functions writes data and meta information to a 
#' PostgreSQL based time series database.  
#' 
#' @param x object of class \code{\link{boots}}.
#' 
#' @param conn connection object that contains connection 
#' with a PostgreSQL database. Usually connections are created
#' using the RPostgreSQL package
#' 
#' @param data_table character string name of the values table
#' in the PostgreSQL database.
#' 
#' @param meta_table character string name of the meta information
#' table in the PostgreSQL database.
#' 
#' @return Object of class \code{\link{boots}}.
#' 
#' @export
#' @author Matthias Bannert
boots2db <- function(x,conn,data_table="timeseries_main",
                     meta_table="localized_meta_data",
                     series_name=NA_character_){
  stopifnot(class(x) == "boots")

  # series name needs to be specified in lapply
  # constructions
  if(is.na(series_name))
    objName <- deparse(substitute(x))
  else
    objName <- series_name

  # create list of hstore objects
  hstore.list <- createHstore(x)
  
  ########################
  # insert data          #
  ########################
  fields.data <- paste(c("ts_key","ts_data","ts_format",
                         "md_generatedon",
                         "md_generatedby","md_unit","md_legacy_key",
                         "md_frequency"),
                       collapse=",")
  values.data <- paste(wrap(c(objName,hstore.list$data,x@ts_format,
                              x@md_generatedon,
                              x@md_generatedby,x@md_unit,
                              x@md_legacy_key,
                              x@md_frequency)),
                       collapse=",")
  
  
  
  statement.data <- paste("INSERT INTO ",data_table," (",
                          fields.data,") VALUES (",values.data,")",sep="")
  
  statement.data <- gsub("NA","NULL",statement.data)
  
  out.data <- dbSendQuery(conn,statement.data)
  
  ########################
  # insert meta data     #
  ########################
  
  fields.meta <- paste(c("ts_key","ts_language","ts_labels"),
                       collapse=",")
  
  for (i in 1:length(hstore.list$meta_data)){
    values.meta <- paste(wrap(c(objName,
                                names(hstore.list$meta_data)[i],
                                hstore.list$meta_data[[i]])),
                         collapse=",")
    
    statement.meta <- paste("INSERT INTO ",meta_table," (",
                            fields.meta,") VALUES (",values.meta,")",sep="")
    
    
    dbGetQuery(conn,statement.meta)
  }
  
  msg <- "Data written to timeseries database without errors."
  
  if(exists("out.data")) paste(msg)
  
}
