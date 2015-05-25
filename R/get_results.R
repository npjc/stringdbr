#' GET results of a query to the STRING-db web service.
#'
#' @param sdb sdb object returned by \code{\link{sdb}}. (named list)
#' @param as format in which to return results. (character string)
#' @param file Specify name of file if you wish to write the results to file.
#' (character string). N.B. not yet implemented.
#' @export
sdb_get_results <- function(sdb, as = "tsv", file = NULL, .request = FALSE) {

  if (is.null(sdb$format)) {
    sdb$format <- as
  }

  sdb$format <- ratify_format(as)

  sdb <- ratify_sdb(sdb)

  if(!is.null(file)) stop("direct file writing not implemented yet.")
  r <- httr::GET(url = sdb$url, path = sdb$path, query = sdb$query)
  if(.request) {
    return(r)
  }
  ratify_request(r)
  parse_results(r, sdb$format)
}

#' Validate if a format is allowed
#' @param format format
#' @return format type (character string)
#' @keywords internal
ratify_format <- function(format) {
  valid <- format %in% ws_$format
  if (valid) {
    return(format)
  } else {
    stop(format, "format not supported.")
  }
}

#' Validate the structure sdb object
#' @param sdb sdb
#' @return sdb object (named list)
#' @keywords internal
ratify_sdb <- function(sdb) {
  valid <- all(
    is.list(sdb),
    c("url", "format", "request", "query") %in% names(sdb))

  if (valid) {
    sdb$path <- paste0("api", "/", sdb$format, "/", sdb$request) ##FIXME
    return(sdb)
  } else {
    stop("sdb object not valid. must at least contain \n $url, $format, $request and $query")
  }
}

#' Validate GET request
#' @param request request
#' @return TRUE if successful or list of status code and content.
#' @keywords internal
ratify_request <- function(request) {
  successful <- httr::status_code(request) == 200
  if (successful) {
    invisible()
  } else {
    stop("request did not succeed. set .request = TRUE for details.")
  }
}
