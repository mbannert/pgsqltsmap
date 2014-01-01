\name{ts_env2data.table}
\alias{ts_env2data.table}
\title{Cast an environment of time series into a data.table}
\usage{
  ts_env2data.table(ts_env_name, overwrite = T,
    meta_env_name = "meta")
}
\arguments{
  \item{ts_env_name}{name of the environment that contains
  the time series}

  \item{overwrite}{boolean should meta information in the
  local R object be overwritten, defaults to TRUE,}

  \item{meta_env_name}{name of the environment that
  contains the meta information}
}
\description{
  This function uses and entire environment containing time
  series plus an environment that contains meta information
  to the time series into one single data.table. It
  transforms the timeseries data into a string
  representation of the hstore format. Hstore is data type
  within postgres SQL that enables users to store key value
  pairs in single table cell. The entire time series is
  stored as a bunch of key value pairs. The data.table
  contains a minimal amount of fixed meta information as
  well. Fixed meta information is meta information that is
  not translated.
}
\author{
  Matthias Bannert
}
\seealso{
  \code{\link{create_line}},\code{\link{add_mi}}
}

