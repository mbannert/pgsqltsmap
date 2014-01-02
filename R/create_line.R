#' Create a single line data.table from a time series
#' 
#' This function is typically not called directly. 
#' it is used to create single line data.tables from univariate time series
#' object. This is useful when multiple objects are summarized in one
#' data.table. Time series are stored in character representation of 
#' hstore key value pairs. 
#' 
#' @param ts_key character time series key
#' @param environment that contains the time series
#' @param meta_env_name name of the meta environment
#' @param answer_label chunk that denotes answer in keys, defaults to "AN"
#' @param restriction minimum number of firms needed to set restriction
#' to FALSE, defaults to 5
#' 
#' @author Matthias Bannert
#' @seealso \code{\link{rbindList}},\code{\link{ts_env2data.table}}
create_line <- function(ts_key,ts_env,meta_env_name,answer_label="AN",
                        restriction=5){
  data_hstore <- create_hstore(get(ts_key,ts_env))
  
  # get restriction information
  # corresponding answer information from time series environment
  l <- length(unlist(strsplit(ts_key,"\\.")))
  item <- strsplit(ts_key,"\\.")[[1]][l]
  ans <- gsub(item,"AN",ts_key)
  restrict <- create_hstore(get(ans,ts_env) < restriction )
  
  data.table(ts_key = ts_key,
             ts_data = data_hstore,
             md_frequency = get(meta_env_name)[[ts_key]]$ts_frequency,
             md_generated_by = get(meta_env_name)[[ts_key]]$ts_edited_by,
             md_generated_on = get(meta_env_name)[[ts_key]]$ts_edited_on,
             md_legacy_key = get(meta_env_name)[[ts_key]]$ts_legacy_key,
             md_source = get(meta_env_name)[[ts_key]]$ts_source,
             md_notes = get(meta_env_name)[[ts_key]]$ts_comment,
             md_restrictions = restrict
  )
  
  # add localized meta information and vintage later on 
  # from create_df_lines... continue to develop write process 
  # now.
  
  
}