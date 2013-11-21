# clear 
rm(list=ls())
# create a time series and mi using miro
require(miro)

CH.KOF.TEST.REGION.ZH.VAR1.ITEM1 <- ts(rnorm(1:100),start=c(1982),frequency=4)

# add some meta information
add_mi(CH.KOF.TEST.REGION.ZH.VAR1.ITEM1)

# add some localized meta information
# english
localized_labels_en <- c("short_title","wording","available_items")
localized_items_en <- c("well being","How are you?","awesome,somewhat ok,wasted")

# german
localized_labels_de <- c("Kurztitel","Wortlaut","mögliche_Antworten")
localized_items_de <- c("Wohlbefinden","Wie geht es?","fantastisch,so lala,total fertig")


# use method to add english meta information
meta$CH.KOF.TEST.REGION.ZH.VAR1.ITEM1$add_localized_mi("en",localized_labels_en,
                                                       localized_items_en)
# german
meta$CH.KOF.TEST.REGION.ZH.VAR1.ITEM1$add_localized_mi("de",localized_labels_de,
                                                       localized_items_de)

meta$CH.KOF.TEST.REGION.ZH.VAR1.ITEM1$ts_localized_mi$de$mögliche_Antworten




# need a create_hstore function for zoo 

# archive_ts function that stores time series data base
# do we want to store time series without meta information?
# warning or stop?


