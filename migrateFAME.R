rm(list=ls())
load("famekey.RData")
load("dluFame.RData")
source("dluDict.R",echo=F)

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

# translate keys in list
dlu.series.li <- as.list(e1)
names(dlu.series.li) <- sapply(names(dlu.series.li),translateFameKey)

# initialize new series object...
new("boots",dlu.series.li$CH.KOF.DLU.NOGA_2D.86.F_945.NEUTRAL)

# create localized meta information
createLocalMetaFromKey <- function(x,questions,items){
  if(!is.character(x)) nm <- deparse(substitute(x)) else
    nm <- x
  
  res <- list()
  res$title <- un
}


setClass("bootsKey",representation())



attributes(dlu.series.li$CH.KOF.DLU.NOGA_2D.86.F_945.NEUTRAL)$seriesNames

attributes(ts(1:10))$seriesNames


.Object,tsObj,unit=NA_character_,
format = "%Y-%m-%d",
legacy_key = NA_character_,
frequency = NA_character_, 
meta_localized = NULL




createBootsFromFame <- function(x){
  key <- deparse(substitute(x))
  dt <- getDataPart(x)
  indx <- attributes(x)$tsp
  
}



saveLegacyKey <- function(x){
  oldKey <- deparse(substitute(x))
  attr(x,"legacy_key") <- oldKey
  x
}

b <- saveLegacyKey(e1$chdlu_49_an)

attributes(e1$chdlu_49_an)

dlu.series.li <- as.list(e1)
names(dlu.series.li) <- sapply(names(dlu.series.li),translateFameKey)
dlu.series.li[1]

test <- sapply(names(dlu.series.li),translateFameKey)
test[8701]

translateFameKey(dlunames[1])

e1$chdlu_49_f1_g00


translateFameKey(names(as.list(e1))[1:2])

test <- names(as.list(e1))
lapply(test,translateFameKey)

