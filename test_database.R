# generate some ts with meta information
source("test.R")

# connect to local database
source("localConnect.R")


require(caroline)

archive_ts <- function(Obj,meta_env_name="meta"){
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
  
  
  # create data.frame for localized meta information
  meta_localized <- create_hstore(get(meta_env_name)[[mi_key]]$ts_localized_mi)
  # just got to ts_key and language name to a data.frame
#   
  
  
#   out <- list()
#   out[[1]] <- md_fixed
#   out[[2]] <- data_hstore
#   #### store meta information
  # 
  #### meta information
  
  # need to recreate table fields according to new miro fields...
  
#   ts_main
  meta_localized
}


# write it to pgsql... gotta check if hstore does work... 
out <- archive_ts(CH.KOF.TEST.REGION.ZH.VAR1.ITEM1)
dbWriteTable(con,"timeseries_main",out,row.names=F,append=T)

# gotta check the wrap
create_hstore(meta$CH.KOF.TEST.REGION.ZH.VAR1.ITEM1$ts_localized_mi)

archive_ts(test)



attr(test,"mi_key")




