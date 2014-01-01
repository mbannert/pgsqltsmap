#' Write a data.table with hstore column to database
#' 
#' This function stores a timeseries data.table which contains 
#' timeseries represented as hstore to a postgres SQL database.
#' 
#' @param con database connection object
#' @param dt a data.table created by \code{\link{env2data.table}}
#' @param tab name of the database table
#' @param overwrite boolean remove existing rows of the same key in the database,
#' defaults to FALSE
#' @seealso \code{\link{env2data.table}}
#' @author Matthias Bannert
#' @export
ts_data_table_2db <- function(con,dt,tab="timeseries_main",
                              overwrite = F){
  # DELETE all rows from database table tab
  # where key is IN ts_key of dt
  if(overwrite){
    dbGetQuery(conn=con,
               paste("DELETE FROM",tab,
                     "WHERE ts_key IN (",
                     paste(wrap(dt$ts_key,"'"),collapse=","),
                     ")")
    )
  }
  # write the entire table to datatable
  dbWriteTable(conn=con,tab,dt,
               row.names=F,append=T)  
  
}