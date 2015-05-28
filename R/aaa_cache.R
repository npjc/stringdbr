ws_ <- new.env()

#' Convenience function for assignment
#' @keywords internal
ws_assign <- function(var, env = stringdbr:::ws_) {
  assign(deparse(substitute(var)), var, envir = env)
}

#' Assign static variables to ws_ environment
#' @keywords internal
ws_build <- function() {

  ## webservice url
  url <- "http://www.string-db.org"
  ws_assign(url)

  ## webservice return formats
  format <- c("json", "tsv", "tsv-no-header", "psi-mi", "psi-mi-tab", "image")
  names(format) <- format
  ws_assign(format)

  ## webserive access_point/request
  request <- c("resolve", "resolveList", "abstracts", "abstractsList", "interactors",
    "interactorsList", "actions", "actionsList", "interactions",
    "interactionsList", "network", "networkList")
  names(request) <- request
  ws_assign(request)

  ## webservice parameters
  parameter <- c("identifier", "identifiers", "format", "species", "limit",
                  "required_score", "additional_network_nodes", "network_flavor",
                  "caller_identity")
  names(parameter) <- parameter
  ws_assign(parameter)
}

# library(rvest)
# h <- read_html("http://string-db.org/help/topic/org.string-db.docs/api.html")
# # select tables inside divs of class = table-contents
# table_nodes <- h %>%
#   html_nodes("div .table-contents table")
# # parse the html tables into list of data.frames
# out <- table_nodes %>% html_table()
# # summary attribute text is used to name list
# names(out) <- table_nodes %>%
#   html_attr("summary")
# # to generate vars code in ws_build()
# out$`List of requests`$request %>% dput() # ws_$request
# out$`List of parameters and values`$parameters %>% dput() # ws_$request
# out$` List of formats  `$format %>% dput() # ws_$request
