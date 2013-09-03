#' Get key / value pairs from a two-column data.frame
#' 
#' This function is used as a helper function to
#' turn a standard data.frame into a named list.
#' The user may specify the values and the names 
#' column. 
#' 
#' @author Matthias Bannert
#' @param df data.frame that should be turned into a named list.
#' Note that only two specified columns will be used.
#' @param n numeric position of the name column
#' @param v numeric position of the value column
#' 
df2list <- function(df,n=1,v=2){
  stopifnot(ncol(df) == 2)
  nm <- df[,n]
  res <- as.list(df[,v])
  names(res) <- nm
  res
}

#' Test for a boots object
#' 
#' @author Matthias Bannert
#' @param x object whose class should be checked
is.boots <- function(x) "boots" %in% class(x)

#' Test for a metalocalized object
#' 
#' This function tests whether an object is of class
#' metalocalized. It's rather not used directly.
#' 
#' @author Matthias Bannert
#' @param x object whose class should be checked
is.metalocalized <- function(x) "metalocalized" %in% class(x)


#' Test for an object of class tsDbResult 
#' 
#' This function tests whether an object is of class
#' tsDbResult. It's rather not used directly. 
#' 
#' @param x object whose class should be checked
#' @author Matthias Bannert
is.tsDbResult <- function(x) "tsDbResult" %in% class(x)

# Wrap characters around another character
wrap <- function(x,char="'"){
  paste(char,x,char,sep="")
}

#' Zoo like Date Conversion
#' 
#' This function is taken from the zoo package. It is basically the
#' S3 method as.Date.numeric of the package zoo. It is used to turn
#' 2005.75 (3rd quarter of 2005) like date formats into dates
#' like 2005-07-01.
#'
#' @param x object of class ts
#' @rdname zooLikeDateConvert
#' @name zooLikeDateconvert
#' 
#' @author Achim Zeileis, Gabor Grothendieck, Jeffrey A. Ryan,
#' Felix Andrews
.zoolike.Date.convert <- function (x, offset = 0, ...) 
{
  time.x <- unclass(time(x)) + offset
  if (frequency(x) == 1) 
    as.Date(paste(time.x, 1, 1, sep = "-"))
  else if (frequency(x) == 4) 
    as.Date(paste((time.x + 0.001)%/%1, 3 * (cycle(x) - 1) + 
                    1, 1, sep = "-"))
  else if (frequency(x) == 12) 
    as.Date(paste((time.x + 0.001)%/%1, cycle(x), 1, sep = "-"))
  else stop("unable to convert ts time to Date class")
}





