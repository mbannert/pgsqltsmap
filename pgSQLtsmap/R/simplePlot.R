#' Simple plot method for boots
#' 
#' This is a preliminary plotting method for objects of class boots. 
#' Basically turns boots objects to standard ts objects and adds meta
#' information. Currently only quarterly data is fully supported. 
#' 
#' @param x object of class \code{\link{boots}}
#' @param ... arguments that are passed to the standard plot function
#' @param l character string indicating the language of the tile.
#' 
#' @export
#' @docType methods
#' @rdname simplePlot-methods
#' @author Matthias Bannert 
setMethod("plot",signature="boots",
          definition=function(x,y=NULL,l="de",...){
            if(x@md_frequency == "4"){
              a <- as.numeric(format(x@ts_index,"%Y")[1])
              b <- as.numeric(gsub(pattern="0","",
                                   format(x@ts_index,"%m"))[1])
              
              plot(ts(x@.Data,start=c(a,b),frequency=as.numeric(x@md_frequency)),
                    main=getMeta(x,lang=l)$title,
                   xlab="",ylab="",type="b")
              
            } else {
              plot(x@.Data,...)
              warning("Axis based on meta information only implemented for quarterly series.")
            }
          })
