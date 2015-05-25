#' contrain STRING-db query with additional parameters
#' @param sdb sdb object
#' @param ... additional parameters
#' @return modified bg object. N.B. current behaviour overwites and previously
#' present params.
#' @export
sdb_constrain <- function(sdb, ...) {

  parameters <- stratify_parameters(list(...))
  # get the names parameters not present in new params, subset old bg$query
  # according to this vector and add new params (effective overwriting)
  old_subset <- setdiff(names(sdb$query), names(parameters))
  sdb[["query"]] <- c(sdb$query[old_subset], parameters)
  sdb
}

#' validate constrain parameters
#' @param param_list list of parameters
#' @return parameter list if valid, stop if not.
#' @keywords internal
stratify_parameters <- function(param_list) {
  allowed_params <- ws_$parameter
  valid <- sapply(names(param_list),`%in%`, allowed_params) %>%
    all()

  if (valid) {
    return(param_list)
  } else {
    stop("invalid parameters. run stringdbr:::ws_$parameter for allowed.")
  }
}
