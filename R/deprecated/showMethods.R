setMethod("show","bootsKey",function(object){
  cat("Object of class bootsKey:", object@fullKey,"\n")
} )


setMethod("show","metalocalized",function(object){
  
  if(length(dt) == 0){
    cat("No localized meta information available for this time series.")
  } else {
    cat("Use getMeta(object) to get all available meta information.
Use getMeta(object,'en') to get english meta information only.
Meta information is available in the following languages: \n")
print(paste(object@nms,collapse=", "))
    
  }
  
})





#' Show Localized Meta Information
#' 
#' This methods displays meta information stored in 
#' an object of class \code{\link{metalocalized}}. Its
#' return is basically a list. It also returns the abbreviation of available languages.
#' 
#' @param object an R object of class \code{\link{metalocalized}},
#'  
#' @param lang character string denoting the language. Only use available 
#' abbrebvation displayed when calling the object.
#'  
#' @return list containing key value pairs. 
#' 
#' @seealso \code{\link{boots}} and \code{\link{metalocalized}}
#'   
#' @export
#' @docType methods
#' @rdname getMeta-methods
#' @author Matthias Bannert  
setGeneric("getMeta",function(object,lang="all"){standardGeneric ("getMeta")})

#' @rdname getMeta-methods
setMethod("getMeta","metalocalized",function(object,lang="all"){
  
  dt <- getDataPart(object)
  names(dt) <- object@nms
  
  # 
  if(lang=="all"){
    dt
  } else {
    dt[[lang]]
  }
  
  
})

#' @rdname getMeta-methods
setMethod("getMeta","boots",function(object,lang){
  getMeta(object@md_meta_localized,lang=lang)
  
})





