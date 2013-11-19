#' Get one or multiple key from database by chunks
#' 
#' This function reads all keys that qualify for the like condition
#' specified in the arguments of this function. 
#' 
#' @param ... chunks of class character that should be use to narrow
#' down selected keys
#' @param conn a postgreSQL connection object
#' @author Matthias Bannert
#' @export
#' @seealso \code{\link{boots2db} and \code{\link{bootsKey}}}
getKeysFromDb <- function(...,conn,
                          relation="timeseries_main"){
  like <- unlist(list(...))
  stopifnot(is.character(like))
  like <- addTag(like,"'%","%'")
  like <- paste(like,collapse=" AND ts_key LIKE ")
  statement <- paste("SELECT ts_key FROM ",relation,
                     " WHERE ts_key LIKE ",like,sep="")
  res <- dbGetQuery(conn,statement)
  res <- as.matrix(res)
  res
}
