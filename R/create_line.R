#' Create a single line data.table from a time series
#' 
#' This function is typically not called directly. 
#' it is used to create single line data.tables from univariate time series
#' object. This is useful when multiple objects are summarized in one
#' data.table. Time series are stored in character representation of 
#' hstore key value pairs. #'
#' 
#' @param ts_key character time series key
#' @param environment that contains the time series
#' @param meta_env_name name of the meta environment
#' @author Matthias Bannert
#' @seealso \code{\link{rbindList}},\code{\link{ts_env2data.table}}
create_line <- function(ts_key,ts_env,meta_env_name){
  data_hstore <- create_hstore(get(ts_key,ts_env))
  data.table(ts_key = ts_key,
             ts_data = data_hstore,
             md_frequency = get(meta_env_name)[[ts_key]]$ts_frequency,
             md_generated_by = get(meta_env_name)[[ts_key]]$ts_edited_by,
             md_generated_on = get(meta_env_name)[[ts_key]]$ts_edited_on,
             md_legacy_key = get(meta_env_name)[[ts_key]]$ts_legacy_key,
             md_source = get(meta_env_name)[[ts_key]]$ts_source,
             md_notes = get(meta_env_name)[[ts_key]]$ts_comment,
             md_restrictions = get(meta_env_name)[[ts_key]]$ts_restrictions
  )
  
  # add localized meta information and vintage later on 
  # from create_df_lines... continue now write process 
  # now.
  
  
}