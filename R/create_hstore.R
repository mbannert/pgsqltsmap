#' Create Postgres Hstore Representation of R objects
#' 
#' This S4 method creates hstore representation of
#' different R objects. In general list based key-value pairs
#' are transformed into a character based assignment of
#' keys to values. 
#' 
#' @param Obj R object. Accepts objects of class
#' \code{\link{list}},
#'  \code{\link{boots}} and \code{\link{metalocalized}}.
#'  
#' @return character string containing postgres SQL
#' hstore style key value pairs.
#' 
#' @seealso \code{\link{boots}} and \code{\link{boots2db}}
#'   
#' @export
#' @docType methods
#' @rdname createHstore-methods   
setGeneric("create_hstore",function(Obj) stopifnot(inherits(Obj,c("zoo","ts","mi_local"))))


#' @rdname createHstore-methods
setMethod("create_hstore",signature(Obj = "ts"),
          function(Obj){
            t_index <- .zoolike.Date.convert(Obj)
            res <- paste(wrap(t_index,'"'),
                         wrap(Obj,'"'),sep = " => ")
          #  res <- wrap(res,"'")
            res <- paste(res,collapse=",")
            res
          }
)

#' @rdname createHstore-methods
setMethod("create_hstore",signature(Obj = "zooreg"),
          function(Obj){
            t_index <- .zoolike.Date.convert(Obj)
            res <- paste(wrap(t_index,'"'),
                         wrap(Obj,'"'),sep = " => ")
            #  res <- wrap(res,"'")
            res <- paste(res,collapse=",")
            res
          }
)





#' @rdname createHstore-methods
setMethod("create_hstore",signature(Obj = "mi_local"),
          function(Obj){
            langs <- ls(Obj)
            if(length(langs) == 0){
              warning("No localized meta information available")
              out <- character(0)
            } else {
              out <- list()
              # loop over all languages
              for (i in 1:length(langs)){
                res <- paste(wrap(keys(Obj[[langs[i]]]),'"'),
                             wrap(values(Obj[[langs[i]]]),'"'),sep = " => ") 
                res <- paste(res,collapse=",")
                out[[i]] <- res
              }
            }
            # give list of hstores back, one per language
            names(out) <- langs
            out
          }
)


