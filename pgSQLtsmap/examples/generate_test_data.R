# create some quarterly time series:

# 2nd Quarter of 1959
series <- ts(rnorm(10), frequency = 4, start = c(1959, 2)) 

# localized meta information, German and ENglisch
ml <- list(de=list(title="Geschäftslage Urteil",
                   selected_item = "gut",
                   description = "Dienstleistungsumfrage basierend auf NOGA08",
                   aggregation_level = "letter",
                   selected_group = "H",
                   survey = "DLU",
                   question_wording = "Wir beurteilen unsere Geschäftslage zur Zeit insgesamt als",
                   item_levels = "keine Angabe, gut, befriedigend, schlecht",
                   weighting_information = "Gewichtung mit Beschäftigten (capped)"
),
           en=list(title="business situation",
                   selected_item = "good",
                   description = "Survey in the service sector based on NOGA08",
                   aggregation_level = "letter",
                   selected_group = "H",
                   survey = "DLU",
                   question_wording = "We assess our business situation as...",
                   item_levels = "no answer, good, satisfactory, bad",
                   weighting_information = "employment weighted (capped)"
           )
)


# create object from localized list, add ts_key
ml <- as(ml,"metalocalized")

# create class of object boots
bseries <- new("boots",series,unit="count",
               legacy_key="AB.CD.12",
               meta_localized=ml)
bseries






