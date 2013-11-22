#' Create single line data.frame from time series
#' 
#' This function creates single line data.frames from time series 
#' that can be bound together and processed by dbWriteTable. This function
#' is a helper function for \code{\link{create_db_table}} and is not meant 
#' to be used as a standalone function.
#' 
#' @author Matthias Bannert
#' @param Obj time series object or name of time series object
#' @param type character based flag, either main or meta. Should localized 
#' meta information or main data be generated. 
#' @param meta_env_name character name of the environment that stores the
#' metainformation
create_df_lines <- function(Obj,type="main",meta_env_name = "meta"){
  if(is.character(Obj)){
    nm <- Obj
    Obj <- get(Obj)
  }
  mi_key <- attr(Obj,"mi_key")
  # throw an error if there is no key attribute
  if(is.null(mi_key)){
    stop_statement <- paste("There is no meta information attached to the key:'",
                            nm,
                            "'. \nStoring to archive is not allowed without meta information.",
                            sep="")
    stop(stop_statement)
  }
  
  
  if(type == "main"){
    data_hstore <- create_hstore(Obj)
    ### create data.frame with fixed information
    ts_main <- data.frame(ts_key = mi_key,
                          ts_data = data_hstore,
                          md_frequency = get(meta_env_name)[[mi_key]]$ts_frequency,
                          md_generated_by = get(meta_env_name)[[mi_key]]$ts_edited_by,
                          md_generated_on = get(meta_env_name)[[mi_key]]$ts_edited_on,
                          md_legacy_key = get(meta_env_name)[[mi_key]]$ts_legacy_key,
                          md_source = get(meta_env_name)[[mi_key]]$ts_source,
                          md_notes = get(meta_env_name)[[mi_key]]$ts_comment,
                          md_restrictions = get(meta_env_name)[[mi_key]]$ts_restrictions)
    # return
    ts_main
  } else if(type == "meta"){
    
    if(length(ls(get(meta_env_name)[[mi_key]]$ts_localized_mi)) != 0){
      # create data.frame for localized meta information
      meta_localized_hstore <- create_hstore(get(meta_env_name)[[mi_key]]$ts_localized_mi) 
      # just got to add ts_key and language name to a data.frame
      meta_localized <- data.frame(ts_key = mi_key,
                                   ts_language = names(meta_localized_hstore),
                                   ts_labels = t(as.data.frame(meta_localized_hstore)),
                                   stringsAsFactors = F
      )  
      # return
      meta_localized
    }
  } else {
    stop("invalid type, only 'main' or 'meta' allowed.")
  } 
  
}

#' Create Table From Time Series
#' 
#' This function creates a data.frame that mimmicks the 
#' the database tables. 
#'
#' @param ts_keys character vector containing all series name.  
#' @param type character based flag, either main or meta. Should localized 
#' meta information or main data be generated. 
#' @param meta_env_name character name of the environment that stores the
#' metainformation
#' @author Matthias Bannert
create_db_table <- function(ts_keys,type="main",
                            meta_env_name = meta_env_name){
  out <- ldply(ts_keys,create_df_lines,type=type)
  out
}