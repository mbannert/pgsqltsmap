#' Time Series Key Object
#' 
#' A time series keys for the \code{\link{boots}} time series
#' format is an S4 object itself.
#' 
#' @section Slots:
#'  \describe{
#'    \item{\code{country}:}{Object of class \code{"character"}}
#'    \item{\code{provider}:}{Object of class \code{"character"}}
#'    \item{\code{src}:}{Object of class \code{"character"}}
#'    \item{\code{level}:}{Object of class \code{"character"}}
#'    \item{\code{selectedLevel}:}{Object of class \code{"character"}}
#'    \item{\code{variable}:}{Object of class \code{"character"}}
#'    \item{\code{item}:}{Object of class \code{"character"}}
#'  }
#'  
#'  @seealso \code{\link{boots}}
#'  @author Matthias Bannert
#'  @exportClass bootsKey
setClass("bootsKey",
         representation(fullKey = "character",
                        country = "character",
                        provider = "character",
                        src = "character",
                        level = "character",
                        selectedLevel = "character",
                        variable = "character",
                        item = "character"
                        )
         )

#' Class to Store Localized Meta Information
#' 
#' This class stores localized meta information in a
#' nested list. Each sublist refers to one particular
#' language. This class is rather not used directly but 
#' as a part of the \code{\link{boots}} class.
#' 
#' @author Matthias Bannert
setClass("metalocalized",representation(.Data="list",
                                        nms="character"))



#' Bannert's Objected Oriented Time Series
#' 
#' Boots is a time series format designed to be easily
#' mapped to a relational database. Besides the datapart
#' boots offers lots of opportunities to store detailed 
#' multi-language meta data. 
#' 
#' @section Slots: 
#'  \describe{
#'    \item{\code{ts_key}:}{Object of class \code{\link{bootsKey}}}
#'    \item{\code{.Data}:}{Object of class \code{"matrix"}}
#'    \item{\code{ts_index}:}{Object of class \code{"Date"}}
#'    \item{\code{md_generatedon}:}{Object of class \code{"character"}}
#'    \item{\code{md_generatedby}:}{Object of class \code{"character"}}
#'    \item{\code{md_unit}:}{Object of class \code{"character"}}
#'    \item{\code{md_legacy_key}:}{Object of class \code{"character"}}
#'    \item{\code{md_frequency}:}{Object of class \code{"character"}}
#'    \item{\code{md_meta_localized}:}{Object of class \code{"metalocalized"}}
#'  }
#'
#' @seealso \code{\link{db2boots}}, \code{\link{boots2db}}  
#' @example examples/generate_test_data.R
#' @author Matthias Bannert
#' @exportClass boots
#' @rdname boots   
setClass("boots",
         representation(ts_key = "bootsKey",
                        .Data = "matrix",
                        ts_index = "Date",                         
                        ts_format = "character",
                        md_generatedon = "character",
                        md_generatedby = "character",
                        md_unit = "character",                         
                        md_legacy_key = "character",
                        md_frequency = "character",
                        md_meta_localized = "metalocalized"
         )
  )


#' Class to Store Query Results Temporarily
#' 
#' This helper class stores query results from queries to the Postgres
#' database temporarily. It is only used to induce the
#' corresponding method when initializing new objects
#' of class \code{\link{boots}}. 
#' 
#' @author Matthias Bannert
setClass("tsDbResult",representation(ts_data = "data.frame",
                                     meta_data = "data.frame")
)
# problem here... method behaves differently with or without zoo
# loaded !





