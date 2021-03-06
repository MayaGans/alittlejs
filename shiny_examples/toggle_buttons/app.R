library(shiny)
source("source.R")

ui <- fluidPage(
    br(), br(),
    includeScript("www/source.js"),
    actionButton("toggle_state", "CLICK ME"),
    actionButton("to_be_toggled", "CAN YOU CLICK?")
)

server <- function(input, output) {
    observeEvent(input$toggle_state, {
        toggle_element(input$to_be_toggled,
                       input$toggle_state %% 2 == 0
                       )
    })
}

shinyApp(ui, server)