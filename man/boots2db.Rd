\name{boots2db}
\alias{boots2db}
\title{Store Boots Objects to PostgreSQL Time Series Database}
\usage{
  boots2db(x, conn = con, data_table = "timeseries_main",
    meta_table = "localized_meta_data",
    series_name = NA_character_)
}
\arguments{
  \item{x}{object of class \code{\link{boots}}.}

  \item{conn}{connection object that contains connection
  with a PostgreSQL database. Usually connections are
  created using the RPostgreSQL package}

  \item{data_table}{character string name of the values
  table in the PostgreSQL database.}

  \item{meta_table}{character string name of the meta
  information table in the PostgreSQL database.}
}
\value{
  Object of class \code{\link{boots}}.
}
\description{
  This functions writes data and meta information to a
  PostgreSQL based time series database.
}
\author{
  Matthias Bannert
}

