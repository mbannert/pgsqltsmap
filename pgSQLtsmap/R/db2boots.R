#' Map Postgres Time Series Data to Boots Object
#' 
#' This function reads data from a PostgreSQL time series 
#' database and stores query results in an R \code{\link{boots}}
#' object.
#' 
#' @param conn connection object that contains connection 
#' with a PostgreSQL database. Usually connections are created
#' using the RPostgreSQL package
#' 
#' @param ts_key time series key that uniquely identifies 
#' a time series in the database.
#' 
#' @param data_table character string name of the values table
#' in the PostgreSQL database.
#' 
#' @param meta_table character string name of the meta information
#' table in the PostgreSQL database.
#' 
#' @return Object of class \code{\link{boots}}.
#' 
#' @author Matthias Bannert
db2boots <- function(conn=con,tskey,
                     data_table="timeseries_main",
                     meta_table="localized_meta_data"){
  
  objName <- deparse(substitute(tskey))
  
  
  fields.data <- paste(c("ts_format","md_generatedon",
                         "md_generatedby",
                         "md_unit","md_legacy_key",
                         "md_frequency"),collapse=",")
  
  
  statement.data <- paste("SELECT ts_key,(each(ts_data)).key,(each(ts_data)).value,",
                          fields.data," FROM ",data_table,
                          " WHERE ts_key = '",objName,"'",
                          " ORDER BY key",
                          sep="")
  
  res.data <- dbGetQuery(conn,statement.data)
  
  # read meta information
  statement.meta <- paste("SELECT ts_key,(each(ts_labels)).key,",
                          "(each(ts_labels)).value,ts_language",
                          " FROM ",meta_table,
                          " WHERE ts_key = '",objName,"'",
                          sep="")
  
  res.meta <- dbGetQuery(conn,statement.meta)
  
  resObj <- new("tsDbResult",ts_data = res.data, meta_data = res.meta )
  
  out <- new("boots",resObj)
  
  out  
}
