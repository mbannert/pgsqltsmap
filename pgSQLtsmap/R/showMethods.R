setMethod("show","bootsKey",function(object){
  cat("Object of class bootsKey:", object@fullKey,"\n")
} )


setMethod("show","metalocalized",function(object){
  cat("Localized meta information is available in: ")
  cat(paste(names(object@ml_localized_list),collapse=", "))
})