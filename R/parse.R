#' Parse results of a request
#' @param request
#' @return data.frame of reusults.
#' @keywords internal
parse_results <- function(request, format) {
  if(format != "tsv") {
    return(httr::conten(request, "text"))
  }
  data.table::fread(httr::content(request,"text"), sep = "\t")
}
