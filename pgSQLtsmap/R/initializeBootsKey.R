setMethod("initialize","bootsKey",function(.Object,tsObj){
  # sanity checks
  stopifnot(is.character(tsObj))
  if(length(unlist(strsplit(tsObj,"\\."))) != 7){
    warning("Format is likely not a ts key. Remember 
  ts keys have to be of the format country.provider.src.level.selectedLevel.variable.item.
  Just using standard object name for now.")
    .Object@fullKey <- tsObj
  } else {
    vec <- unlist(strsplit(tsObj,"\\."))
    
    .Object@fullKey <- tsObj
    .Object@country <- vec[1]
    .Object@provider <- vec[2]
    .Object@src <- vec[3]
    .Object@level <- vec[4]
    .Object@selectedLevel <- vec[5]
    .Object@variable <- vec[6]
    .Object@item <- vec[7]    
  }
  
  .Object
}
          )