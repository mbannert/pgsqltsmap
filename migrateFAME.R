
rm(list=ls())
source("connect.R")
load("famekey.RData")
load("dluFame.RData")
source("dluDict.R",echo=F)
source("functions.R",echo=F)
require(pgSQLtsmap)


# turn environment into list and rename it using translate
dlu.series.li <- as.list(e1)
names(dlu.series.li) <- sapply(names(dlu.series.li),
                               translateFameKey)



serieslist <- lapply(seq_along(dlu.series.li),
                 function(y,nm,i){new("boots",tsObj=y[[i]],
                                      series_name=nm[[i]])},
                 y = dlu.series.li,
                 nm = names(dlu.series.li))

names(serieslist) <- names(dlu.series.li)


results <- lapply(serieslist,addMetaFromKey,dictQ=unqQ.de,l="de")
results <- lapply(results,addMetaFromKey,dictQ=unqQ.en,l="en")




# write stuff to database with lapply

lapply(seq_along(results),
                 function(y,nm,i){
                   boots2db(x=y[[i]],conn=con,
                            series_name=nm[[i]]
                            )
                 },
                 y = results,
                 nm = names(results))



# test code, fewer instances

tlist <- dlu.series.li[1:10]
names(tlist) <- sapply(names(tlist),
                       translateFameKey)
# 3 and 6 are identical


# #fix problem with rownames(ts) is empty / numeric. need a Date here!
# test <- dlu.series.li$CH.KOF.DLU.GROUP.DL3.F_950.BALANCE
# new("boots",test,series_name="CH.KOF.DLU.GROUP.DL3.F_950.BALANCE")


litest <- lapply(seq_along(dlu.series.li[1:10]),
                 function(y,nm,i){new("boots",tsObj=y[[i]],
                                      series_name=nm[[i]])},
                 y = dlu.series.li[1:10],
                 nm = names(dlu.series.li[1:10]))

names(litest) <- names(dlu.series.li[1:10])


# [1] "title" "selected_item" "description" "aggregation_level" "selected_group"       
# [6] "survey" "question_wording" "item_levels" "weighting_information"

res <- lapply(litest,addMetaFromKey,dictQ=unqQ.de,l="de")
res <- lapply(res,addMetaFromKey,dictQ=unqQ.en,l="en")



# test whether localized meta information is there.. nice!
getMeta(res$CH.KOF.DLU.NOGA_3D.722.F_949.POSITIVE)
