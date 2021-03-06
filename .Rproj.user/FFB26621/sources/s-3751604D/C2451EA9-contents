library(shiny)
source("circleInput.R")

ui <- fluidPage(
  circleInput("circles"),
  verbatimTextOutput("debug")
)

server <- function(input, output) {
  output$debug <- renderText(input$circles)
}

shinyApp(ui = ui, server = server)
