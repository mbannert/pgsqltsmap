setMethod("initialize","boots",function(.Object,tsObj,unit=NA_character_,
                                        format = "%Y-%m-%d",
                                        legacy_key = NA_character_,
                                        frequency = NA_character_, 
                                        meta_localized = NULL,
                                        series_name = NA_character_
){
  if(!exists("zoo")) {
    warning("zoo package is not loaded, time indexes can be lost.")
    is.zoo <- function(x) "zoo" %in% class(x)
  } 
  
  # mandatory properties
  if(is.zoo(tsObj) || is.ts(tsObj)){
    # character based key turned into nested OO key
    if(is.na(series_name)) ckey <- deparse(substitute(tsObj)) else
      ckey <- series_name
     
    .Object@ts_key <- new("bootsKey",ckey)
     
    .Object@.Data <- as.matrix(tsObj)
    .Object@ts_index <- as.numeric(time(tsObj))
    .Object@md_generatedon <- as.character(Sys.Date())
    .Object@md_generatedby <- Sys.getenv("USER")
    
    colnames(.Object@.Data) <- unit
    
    # recommended properties 
    .Object@md_unit <- unit
    .Object@ts_format <- format
    if(!is.null(attributes(tsObj)$seriesNames)) {
      .Object@md_legacy_key <- attributes(tsObj)$seriesNames
    } else {
      .Object@md_legacy_key <- legacy_key
    }
      
    
    .Object@md_frequency <- as.character(frequency(tsObj))
    
  } else if(is.tsDbResult(tsObj)) {
    
    # check for NULL values and turn them to character NA
    if(is.null(unique(tsObj@ts_data$mdunit))) unit <- NA_character_ else
      unit <- unique(tsObj@ts_data$md_unit)
    
    if(is.null(unique(tsObj@ts_data$md_legacy_key))) legacy_key <- NA_character_ else
      legacy_key <-  unique(tsObj@ts_data$md_legacy_key)
    
     ckey <- unique(tsObj@ts_data$ts_key)
    .Object@ts_key <- new("bootsKey",ckey)
    .Object@.Data <- as.matrix(as.numeric(tsObj@ts_data$value))
    rownames(.Object@.Data) <- tsObj@ts_data$key
    .Object@ts_index <- as.numeric(as.Date(tsObj@ts_data$key))
    
    .Object@md_generatedon <- unique(as.character(as.Date(tsObj@ts_data$md_generatedon)))
    .Object@md_generatedby <- unique(tsObj@ts_data$md_generatedby)
    
    colnames(.Object@.Data) <- unit
    .Object@md_unit <- unit
    .Object@ts_format <- unique(tsObj@ts_data$ts_format)
    .Object@md_legacy_key <- unique(tsObj@ts_data$md_legacy_key)
    .Object@md_frequency <- unique(tsObj@ts_data$md_frequency)
    
    # split meta information by language
    meta_data.split <- split(tsObj@meta_data[,c("key","value")],
                             tsObj@meta_data$ts_language)
    meta_data.list <- lapply(meta_data.split,df2list)
    
    meta_localized <- new("metalocalized", meta_data.list)
    
  } else {
    stop("Input is not of valid class. Only ts,zoo and tsDbResult objects are supported")
  }
  
  
  
  # meta localized
  if(!is.null(meta_localized)){
    .Object@md_meta_localized <- meta_localized
    .Object
  } else {
    .Object  
  }
  
})
