#' Extend or Replace Localized Meta Information
#' 
#' The methods appendMeta and replaceMeta replace replace or
#' append localized meta information stored objects of class
#' \code{\link{metalocalized}}. 
#' 
#' @param object an R object of class \code{\link{metalocalized}}
#' or \code{\link{boots}}.
#'  
#' 
#' @seealso \code{\link{boots}} and \code{\link{metalocalized}}
#'   
#' @export
#' @docType methods
#' @rdname replaceMeta-methods
#' @author Matthias Bannert  
setGeneric("appendMeta<-",function(object,value){standardGeneric("appendMeta<-")})

#' @rdname replaceMeta-methods
setReplaceMethod("appendMeta","metalocalized",
                 definition=function(object,value){
                   if(is.null(object@nms))
                     paste("is null")
                   li <- object@.Data
                   nm <- object@nms
                   if(names(value) %in% nm) stop("language already exists")
                   object@.Data <- c(li,value) 
                   object@nms <- c(nm,value@nms)
                   object
                 })

#' @rdname replaceMeta-methods
setReplaceMethod("appendMeta","boots",
                 definition=function(object,value){
                 stopifnot(class(object) %in% "boots")
                 appendMeta(object@md_meta_localized) <- value
                 object
                 })


#' @rdname replaceMeta-methods
setGeneric("replaceMeta<-",function(object,value){standardGeneric("replaceMeta<-")})
setReplaceMethod("replaceMeta","metalocalized",
                 definition=function(object,value){
                   object@names <- names(value)
                   object@.Data <- value@.Data
                   object
                 })

#' @rdname replaceMeta-methods
setReplaceMethod("replaceMeta","boots",
                 definition=function(object,value){
                   stopifnot(class(object) %in% "boots")
                   replaceMeta(object@md_meta_localized) <- value
                   object
                 })


