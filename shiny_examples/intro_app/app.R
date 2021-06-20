library(shiny)
library(palmerpenguins)
library(dplyr)
library(ggplot2)

numericPenguins <- colnames(select_if(penguins, is.numeric))

ui <- fluidPage(

    titlePanel("Intro to Shiny"),

    sidebarLayout(
        sidebarPanel(
            selectInput("xvar", "X Variable", choices = numericPenguins),
            selectInput("yvar", "Y Variable", choices = numericPenguins)
        ),
        mainPanel(
           plotOutput("penguinPlot")
        )
    )
)

server <- function(input, output) {
    
    # call the output of our plot input
    output$penguinPlot <- renderPlot({
        # use the input values 
        # xvar and yvar to create our plot
        # note:
        # pass in x and y as strings!
        ggplot(penguins, aes_string(x = input$xvar, y = input$yvar, color = 'species')) +
            geom_point() +
            theme_bw() +
            # a bunch of unnesscary styling because its me
            scale_color_manual(
                values = c("#FF6B01", "#C95BCB", "#067176")
            ) +
            theme(axis.text = element_text(size = 15),
                  axis.title.y = element_text(size = 20),
                  axis.title.x = element_text(size = 20),
                  legend.title = element_text(size = 20),
                  legend.text = element_text(size = 15))
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
