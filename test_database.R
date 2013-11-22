# generate some ts with meta information
source("test.R")

# connect to local database
source("localConnect.R")


require(caroline)

archive_ts <- function(Obj,meta_env_name="meta"){
  # define objects used in the entire function
  out <- list()
  mi_key <- attr(Obj,"mi_key")
  
  # throw an error if there is no meta information
  if(is.null(mi_key)){
    stop("There is no meta information attached to this series.
         Storing to archive is not allowed without meta information.")
  }
  
  #### turn data to hstore
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
  
  # write ts data to table
  out[[1]] <- dbWriteTable(con,"timeseries_main",ts_main,row.names=F,append=T)
  out[[2]] <- "no localized meta information available."
  
  # check whether localized meta information is available
  if(length(ls(get(meta_env_name)[[mi_key]]$ts_localized_mi)) == 0 ){
    warning("No localized meta information available")
  } else {
    
    # create data.frame for localized meta information
    meta_localized_hstore <- create_hstore(get(meta_env_name)[[mi_key]]$ts_localized_mi)
    # just got to add ts_key and language name to a data.frame
    meta_localized <- data.frame(ts_key = mi_key,
                                 ts_language = names(meta_localized_hstore),
                                 ts_labels = t(as.data.frame(meta_localized_hstore)),
                                 stringsAsFactors = F
                                 )  
    # write meta information to database
    out[[2]] <- dbWriteTable(con,"localized_meta_data",meta_localized,row.names=F,append=T)
    
  }
  
  # label feedback for the user
  names(out) <- c("Data successfully written",
                  "Meta information succesfully written")
  
  # return
  out
  
}



create_df_lines <- function(Obj,type="main",meta_env_name = "meta"){
  if(is.character(Obj)){
    Obj <- get(Obj)
  }
  mi_key <- attr(Obj,"mi_key")
  # throw an error if there is no key attribute
  if(is.null(mi_key)){
    stop_statement <- paste("There is no meta information attached to the key: ",
                            mi_key,"Storing to archive is not allowed without meta information.")
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
    
  } else {
    stop("invalid type, only 'main' or 'meta' allowed.")
  } 
  
}


create_db_table <- function(ts_keys,type="main"){
  require(plyr)
  out <- ldply(ts_keys,create_df_lines,type=type)
  out
}

create_db_table(c("CH.KOF.TEST.REGION.ZH.VAR1.ITEM1"),type="meta")

as.data.frame(test)








# write it to pgsql... gotta check if hstore does work... 
out <- archive_ts(CH.KOF.TEST.REGION.ZH.VAR1.ITEM1)
out <- archive_ts(ts2)
str(out)

str(data.frame(ts_key = "CH",ts_language = names(out),
           ts_labels = t(as.data.frame(out)),
    stringsAsFactors = F))



dbWriteTable(con,"localized_meta_data",out,row.names=F,append=T)

dbWriteTable(con,"timeseries_main",out,row.names=F,append=T)

# gotta check the wrap
create_hstore(meta$CH.KOF.TEST.REGION.ZH.VAR1.ITEM1$ts_localized_mi)

archive_ts(test)



attr(test,"mi_key")




