\name{create_db_table}
\alias{create_db_table}
\title{Create Table From Time Series}
\usage{
  create_db_table(ts_keys, type = "main",
    meta_env_name = meta_env_name, ...)
}
\arguments{
  \item{ts_keys}{character vector containing all series
  name.}

  \item{type}{character based flag, either main or meta.
  Should localized meta information or main data be
  generated.}

  \item{meta_env_name}{character name of the environment
  that stores the meta information}
}
\description{
  This function creates a data.frame that mimmicks the the
  database tables.
}
\note{
  Write a better version of this function that supports
  objects and object names(just like its helper function).
  Currently ts_keys only supports character vectors.
}
\author{
  Matthias Bannert
}

