#' Get one or multiple keys from database by chunks
#' 
#' This function reads all keys that qualify for the like condition
#' specified in the arguments of this function. 
#' 
#' @param ... chunks of class character that should be used to narrow
#' down selected keys
#' @param conn a postgreSQL connection object
#' @author Matthias Bannert
#' @export
search_db_for_keys <- function(...,conn,
                          relation="timeseries_main"){
  like <- unlist(list(...))
  stopifnot(is.character(like))
  like <- add_tag(like,"'%","%'")
  like <- paste(like,collapse=" AND ts_key LIKE ")
  statement <- paste("SELECT ts_key FROM ",relation,
                     " WHERE ts_key LIKE ",like,sep="")
  res <- dbGetQuery(conn,statement)
  res <- as.matrix(res)
  res
}
