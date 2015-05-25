#' Convenient and Reproducible Access to STRING-db data
#'
#'
#' @section Design:
#'
#' Most if not all functions start with \code{sdb_*} for convenient auto-
#' completion.
#'
#' Package designed to play with %>% from maggritr.
#'
#' @docType package
#' @name stringdbr
NULL

.onLoad <- function(...) {
  ws_build()
  packageStartupMessage("stringdbr: Beginner developer minions about. ",
                        "Be on the lookout. ")
}
