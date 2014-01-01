\name{add_vintage_to_db}
\alias{add_vintage_to_db}
\title{Archive a Vintage of an Existing Time Series}
\usage{
  add_vintage_to_db(con, Obj, ...)
}
\arguments{
  \item{con}{a Postgres Connection Object,}

  \item{Obj}{character name of the time series that
  contains the vintage information}

  \item{...}{optional arguments, namely vintage_key. Could
  change that to a fixed argument.}
}
\description{
  This function stores a vintage of an existing time series
  to the vintage table of the Postgres database. It only
  works if a corresponding main time series exists. The
  link to the timeseries is made by the attribute NOT by
  the name of the time series. Hence, myseries_vintage and
  myseries have the same mi_key attribute. Vintage series
  can be marked by additional vintage_key.
}
\author{
  Matthias Bannert
}

