# code adapted from https://github.com/jdtrat/shinysurveys/commit/f6b214389f6f264ba91f842fc5001c0ee16814c9
# and https://github.com/daattali/shinyjs

enable_element <- function(.id) {
  session <- shiny::getDefaultReactiveDomain()
  session$sendCustomMessage(
    "enable",
    list(input_id = .id)
  )
}

disable_element <- function(.id) {
  session <- shiny::getDefaultReactiveDomain()
  session$sendCustomMessage(
    "disable",
    list(input_id = .id)
  )
}

toggle_element <- function(id, condition) {
  
  id <- deparse(substitute(id))
  id <- sub("^[^$]*", "", id)
  id <-sub('.', '', id)
  
  if (!condition) {
    disable_element(.id = id)
  } else if (condition) {
    enable_element(.id = id)
  }
}

