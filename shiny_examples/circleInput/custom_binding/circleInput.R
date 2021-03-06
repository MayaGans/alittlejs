#' @title A Shiny Circle Input
#' @import shiny
#' @param inputId The input id
#' @return the color of the selected circle
#' @export
#'
#' @examples

circleInput <- function(inputId) {
  
  # we create a dependency on the package with the JS code
  # needed to bind this function with JS
  # the src can be found inside inst
  htmltools::tagList(
    htmltools::htmlDependency(
      name    = "circleInput"
      , version = "0.0.1"
      , src = "inst"
      , script = "circleInput.js"
      # , stylesheet = "styles.css"
    ),
    # we put our svg input inside a div
    htmltools::tags$div(
      class = "circleInput",
      id = inputId,
      # and give it the data-input property of our id
      # we can leverage this in the JS
      `data-input-id` = inputId,
      # right now this is just three circles: red, blue, and yellow
      # it'd be cool to maybe adapt this so the input can take on
      # colors as arguments and we can change the fill and "circle-type"
      # based on the supplied vector of colors?
      # We could even use map over the string
      # so you can include as many circles as you want?
      htmltools::HTML(
        "<svg class='circ' height='100' width='100' xmlns='http://www.w3.org/2000/svg'>
        <circle circle-type ='circ_red' cx='50' cy='50' r='40' stroke='black' stroke-width='3' fill='red'/>
      </svg>
      <svg id ='circ_blue' class='circ' height='100' width='100' xmlns='http://www.w3.org/2000/svg'>
        <circle circle-type ='circ_blue' cx='50' cy='50' r='40' stroke='black' stroke-width='3' fill='blue' />
      </svg>
      <svg id ='circ_yellow'class='circ' height='100' width='100' xmlns='http://www.w3.org/2000/svg'>
        <circle circle-type ='circ_yellow' cx='50' cy='50' r='40' stroke='black' stroke-width='3' fill='yellow'/>
      </svg>"
      )
    )
  )
}
