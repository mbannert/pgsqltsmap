translateFameKey <- function(x,country="CH",
                             provider="KOF",
                             src="DLU",
                             s="_",
                             dictQ = unqQ,
                             dictI = item.df){
  if(!is.character(x)){
    key <- deparse(substitute(x))  
  } else {
    key <- x
  }
  
  pts <- unlist(strsplit(key,s))
  l <- length(pts)
  # country.provider.source.level.selectedLevel.variable.item
  # remove dots
  pts <- gsub(pattern="\\.","",pts)
  if(length(grep("^[[:digit:]]*$", pts[2])) != 0){
    level <- paste("NOGA_",nchar(pts[2]),"d",sep="")
  } else {
    if(nchar(pts[2]) == 1) level <- "letter" else level <- "group"  
  }
  
  item <- dictI[dictI$FAME == pts[l],"tsdb"]
  
  # distinguish 3 and 4 part keys
  if(l == 3){
    variable <- "total"
  } 
  
  if(l == 4){
    variable <- dictQ[dictQ$F_FAME == pts[3],"FELD"]
  }
  
  
  
  out <- paste(country,provider,src,level,pts[2],
               variable,item,sep=".")
  out <- toupper(out)
  out
  
}

# Fame Key creator
addMetaFromKey <- function(x,dictQ,l="de",repl=FALSE){
  ee <- new.env()
  #res <- list()
  lang <- list()
  lang$title <- dictQ[dictQ[,"FELD"] == x@ts_key@variable,"title"]
  lang$aggregation_level <- x@ts_key@level
  lang$selected_level <- x@ts_key@selectedLevel 
  #   res$question_wording
  lang$item_levels <- dictQ[dictQ[,"FELD"] == x@ts_key@variable,"item_levels"]
  lang$weighting_information <- dictQ[dictQ[,"FELD"] == x@ts_key@variable,
                                      "weighting_information"]
  assign(l,lang,envir=ee)
  out <- as.list(ee)
  out
  out <- new("metalocalized",out)
  #   appendMeta(x@md_meta_localized) <- out
  #   
  # x
  if(is.null(names(x@md_meta_localized)))
    x@md_meta_localized <- out
  else
    if(repl==FALSE)
      appendMeta(x) <- out
  else
    replaceMeta(x) <- out
  x
}




