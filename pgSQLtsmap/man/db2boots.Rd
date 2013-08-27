\name{db2boots}
\alias{db2boots}
\title{Map Postgres Time Series Data to Boots Object}
\usage{
  db2boots(conn = con, tskey,
    data_table = "timeseries_main",
    meta_table = "localized_meta_data")
}
\arguments{
  \item{conn}{connection object that contains connection
  with a PostgreSQL database. Usually connections are
  created using the RPostgreSQL package}

  \item{ts_key}{time series key that uniquely identifies a
  time series in the database.}

  \item{data_table}{character string name of the values
  table in the PostgreSQL database.}

  \item{meta_table}{character string name of the meta
  information table in the PostgreSQL database.}
}
\value{
  Object of class \code{\link{boots}}.
}
\description{
  This function reads data from a PostgreSQL time series
  database and stores query results in an R
  \code{\link{boots}} object.
}
\author{
  Matthias Bannert
}

