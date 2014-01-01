\name{archive_new_ts}
\alias{archive_new_ts}
\title{Write One Or More Time Series to the Time Series Archive}
\usage{
  archive_new_ts(ts_keys, meta_env_name = "meta")
}
\arguments{
  \item{ts_keys}{character vector containing all series
  names.}

  \item{meta_env_name}{character name of the environment
  that stores the metainformation}
}
\description{
  This function makes use of \code{\link{dbWriteTable}} to
  store one more time series and its meta information into
  a PostgreSQL database. This function is meant to bulk
  import new time series and its meta information.
}
\author{
  Matthias Bannert
}

