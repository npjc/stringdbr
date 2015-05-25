#' Build a STRING-db query
#' @param access_point what to query for (character string). See
#' details for available options.
#' @export
sdb <- function(access_point) {
  access_point <- ratify_access_point(access_point)
  list(url = ws_$url, request = ws_$request[[access_point]])
}

#' validate access_point and retrieve it.
#' @param access_point (character string)
#' @return access point uri (character string)
#' @keywords internal
ratify_access_point <- function(access_point) {
  valid <- access_point %in% ws_$request
  if (valid) {
    ws_$request[[access_point]]
  }else {
    stop(access_point, " is not a valid access point.")
  }
}
