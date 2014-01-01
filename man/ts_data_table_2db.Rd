\name{ts_data_table_2db}
\alias{ts_data_table_2db}
\title{Write a data.table with hstore column to database}
\usage{
  ts_data_table_2db(con, dt, tab = "timeseries_main",
    overwrite = F)
}
\arguments{
  \item{con}{database connection object}

  \item{dt}{a data.table created by
  \code{\link{env2data.table}}}

  \item{tab}{name of the database table}

  \item{overwrite}{boolean remove existing rows of the same
  key in the database, defaults to FALSE}
}
\description{
  This function stores a timeseries data.table which
  contains timeseries represented as hstore to a postgres
  SQL database.
}
\author{
  Matthias Bannert
}
\seealso{
  \code{\link{env2data.table}}
}

