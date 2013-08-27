\name{boots}
\alias{boots}
\title{Bannert's Objected Oriented Time Series}
\description{
  Boots is a time series format designed to be easily
  mapped to a relational database. Besides the datapart
  boots offers lots of opportunities to store detailed
  multi-language meta data.
}
\section{Slots}{
  \describe{ \item{\code{ts_key}:}{Object of class
  \code{"character"}} \item{\code{.Data}:}{Object of class
  \code{"matrix"}} \item{\code{ts_index}:}{Object of class
  \code{"numeric"}} \item{\code{md_generatedon}:}{Object of
  class \code{"character"}}
  \item{\code{md_generatedby}:}{Object of class
  \code{"character"}} \item{\code{md_unit}:}{Object of
  class \code{"character"}}
  \item{\code{md_legacy_key}:}{Object of class
  \code{"character"}} \item{\code{md_frequency}:}{Object of
  class \code{"character"}}
  \item{\code{md_meta_localized}:}{Object of class
  \code{"metalocalized"}} }
}
\examples{
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
ml.1 <- new("metalocalized",ts_key="bseries",
            ml_localized_list = ml)

# create class of object boots
bseries <- new("boots",series,unit="count",
               legacy_key="AB.CD.12",
               meta_localized=ml.1)
bseries






}
\author{
  Matthias Bannert
}

