#' Cast an environment of time series into a data.table
#' 
#' This function uses and entire environment containing time series 
#' plus an environment that contains meta information to the time series 
#' into one single data.table. It transforms the timeseries data into 
#' a string representation of the hstore format. Hstore is data type within
#' postgres SQL that enables users to store key value pairs in single table 
#' cell. The entire time series is stored as a bunch of key value pairs. 
#' The data.table contains a minimal amount of fixed meta information as well. 
#' Fixed meta information is meta information that is not translated. 
#' 
#' @param ts_env_name name of the environment that contains the time series
#' @param overwrite boolean should meta information 
#' in the local R object be overwritten, defaults to TRUE,
#' @param meta_env_name name of the environment that contains the meta
#' information
#' @author Matthias Bannert
#' @seealso \code{\link{create_line}},\code{\link{add_mi}}
#' @export
ts_env2data.table <- function(ts_env_name,overwrite=T,meta_env_name="meta"){
  # list all element names of the given environments, i.e. all names of the 
  # time series
  series <- ls(envir=get(ts_env_name))
  # lapply call of add_mi to add a meta information object to 
  # the enviroment called meta_env_name
  l <- lapply(series,add_mi,ts_env=ts_env_name,overwrite=overwrite)
  # lapply create_line over all time series:
  # result is a list of single line data.tables
  # use data.tables rbindList to finally bind these list
  # elements row-wise
  out <- data.table::rbindlist(lapply(series,
                                      create_line,
                                      ts_env=get(ts_env_name),
                                      meta_env_name=meta_env_name))
  paste(length(l),"meta objects created.")
  out
}