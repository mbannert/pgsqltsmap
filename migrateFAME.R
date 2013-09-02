rm(list=ls())
load("famekey.RData")
load("dluFame.RData")
source("dluDict.R",echo=F)
source("functions.R",echo=F)

# turn environment into list and rename it using translate
dlu.series.li <- as.list(e1)
names(dlu.series.li) <- sapply(names(dlu.series.li),
                               translateFameKey)

CH.KOF.DLU.LETTER.R.F_950.POSITIVE <- dlu.series.li$CH.KOF.DLU.LETTER.R.F_950.POSITIVE
test <- new("boots",CH.KOF.DLU.LETTER.R.F_950.POSITIVE)


test2 <- new("boots",CH.KOF.DLU.LETTER.R.F_950.POSITIVE,series_name="moo")




litest <- lapply(seq_along(dlu.series.li[1:10]),
       function(y,nm,i){new("boots",tsObj=y[[i]],
                            series_name=nm[[i]])},
       y = dlu.series.li[1:10],
       nm = names(dlu.series.li[1:10]))

names(litest) <- names(dlu.series.li)


# [1] "title" "selected_item" "description" "aggregation_level" "selected_group"       
# [6] "survey" "question_wording" "item_levels" "weighting_information"

fullObj <- litest[[2]]

unqQ.de

# country.provider.src.level.selectedLevel.variable.item

# turn the following process into a list apply!
test <- addMetaFromKey(fullObj,unqQ.de,l="de")
test@md_meta_localized

testb <- addMetaFromKey(fullObj,unqQ.en,l="en")
testb@md_meta_localized

appendMeta(test)<-testb@md_meta_localized
test@md_meta_localized@.Data


test1 <- addMetaFromKey(test,unqQ.en,l="en")
test1@md_meta_localized

# finetune labels a little bit... 
# store results to database


