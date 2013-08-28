
# reasonable item values
item.df <- data.frame(FAME=c("an","be","g00","m00","p00","s00","%00"),
                      tsdb=c("answers","staff_count","neutral","negative",
                             "positive","balance","share"),
                      unit=c("count","count","percent","percent","percent",
                             "percent","percent"),
                      de=c("Antworten","Beschäftigte","neutral","negativ",
                           "positiv","Saldo","Anteil"),
                      en=c("answers","employees","neutral","negative",
                           "positive","balance","share"))

# reasonable unique question identifieres...
unqQ <- structure(list(FELD = c("F_945", "F_945", "F_945", "F_946", "F_946", 
                                "F_946", "F_947", "F_947", "F_947", "F_948", "F_948", "F_948", 
                                "F_949", "F_949", "F_949", "F_950", "F_950", "F_950", "F_951", 
                                "F_951", "F_951", "F_952", "F_952", "F_952", "F_953", "F_953", 
                                "F_953", "F_954", "F_954", "F_954", "F_955", "F_955", "F_955", 
                                "F_956", "F_956", "F_956", "F_958", "F_958", "F_958", "F_959", 
                                "F_959", "F_959", "F_960", "F_960", "F_960", "F_961", "F_961", 
                                "F_961"), F_FAME = c("f1", "f1", "f1", "f2", "f2", "f2", "f3", 
                                                     "f3", "f3", "f4", "f4", "f4", "f5", "f5", "f5", "f6", "f6", "f6", 
                                                     "f7a", "f7a", "f7a", "f7b", "f7b", "f7b", "f7c", "f7c", "f7c", 
                                                     "f7d", "f7d", "f7d", "f7e", "f7e", "f7e", "f7f", "f7f", "f7f", 
                                                     "f8", "f8", "f8", "f9", "f9", "f9", "f10", "f10", "f10", "f11", 
                                                     "f11", "f11")), .Names = c("FELD", "F_FAME"), class = "data.frame", row.names = c(NA, 
                                                                                                                                       48L))
unqQ <- unique(unqQ)
unqQ.de <- data.frame(unqQ,title=c("Geschäftslage Urteil",
                        "Nachfrage letzte 3 Monate",
                        "Beschäftigte Urteil",
                        "Technische Kapazitäten Urteil",
                        "Ertragslage letzte 3 Monate",
                        "Wettbewerbsposition letzte 3 Monate",
                        "Leistungshemmnisse ",
                        "Leistungshemmnisse ",
                        "Leistungshemmnisse ",
                        "Leistungshemmnisse ",
                        "Leistungshemmnisse ",
                        "Leistungshemmnisse ",
                        "Nachfrage nächste 3 Monate",
                        "Beschäftigte nächste 3 Monate",
                        "Preise nächste 3 Monate",
                        "Geschäftslage nächste 3 Monate"),
                      item_levels=c("keine Angabe, gut, befriedigend, schlecht",
                                    "keine Angabe, gut, befriedigend, schlecht",
                                    "keine Angabe, gut, befriedigend, schlecht",
                                    "keine Angabe, gut, befriedigend, schlecht",
                                    "keine Angabe, gut, befriedigend, schlecht",
                                    "keine Angabe, gut, befriedigend, schlecht",
                                    "keine Angabe, ungenügende Nachfrage",
                                    "keine Angabe, Mangel an Arbeitskräften",
                                    "keine Angabe, unzureichende technische Kapazitäten",
                                    "keine Angabe, wirtschaftliche und gesetzliche Rahmenbedingungen",
                                    "keine Angabe, Finanzierungsengpässe",
                                    "keine Angabe, keine Hemmnisse",
                                    "keine Angabe, gut, befriedigend, schlecht",
                                    "keine Angabe, gut, befriedigend, schlecht",
                                    "keine Angabe, gut, befriedigend, schlecht",
                                    "keine Angabe, gut, befriedigend, schlecht"
                                    ),
                      weighting_information = "Beschäftigungsgewicht (capped)"
                      )





