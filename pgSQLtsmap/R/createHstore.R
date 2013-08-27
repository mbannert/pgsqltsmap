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
setGeneric("createHstore",function(Obj) stopifnot(is.list(Obj)))

#' @rdname createHstore-methods   
setMethod("createHstore",signature(Obj = "list"),
          function(Obj){
                        nm <- names(Obj)
                        v <- unlist(Obj)
                        v <- wrap(v,'"')
  
                        res <- paste(nm,v,sep=" => ")
                        res <- paste(res,collapse=",")
                        res
          }
)

#' @rdname createHstore-methods
setMethod("createHstore",
          signature(Obj = "boots"),
          function (Obj) 
          {
            # key value pair time series
            nms <- rownames(getDataPart(Obj))
            li <- as.list(getDataPart(Obj))
            names(li) <- nms
            kvp <- createHstore(li)
            
            # localized meta information
            ml <- Obj@md_meta_localized
            ml.res <- createHstore(ml)
            
            # create output
            out <- list()
            out[["data"]] <- kvp
            out[["meta_data"]] <- ml.res
            out
          }
)

#' @rdname createHstore-methods
setMethod("createHstore",
          signature(Obj = "metalocalized"),
          function (Obj) 
          {
            nl <- Obj@ml_localized_list
            nms <- names(nl)
            res <- lapply(nl,createHstore)
            names(res) <- nms
            res
          }
)
