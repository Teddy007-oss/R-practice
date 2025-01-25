#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application that draws a histogram
library(shiny)
library(bslib)


counties <- readRDS("/Users/a40/Desktop/Work/App-1/Data/counties.rds")
head(counties)

install.packages("maps")
install.packages("mapproj")

library(mapproj)
source("/Users/a40/Desktop/Work/App-1/helpers.R")

percent_map(counties$white, "darkgreen", "%White")

# Define UI for app that draws a histogram ----
ui <- page_sidebar(
  title = "censusVis",
  sidebar = sidebar(
    helpText("Create demagraphic maps with information from the from the US 2010 consensus"),
    selectInput(
      "var",
      label = "Choose variable to display",
      choices = list("Percent White", "Percent Black" , "Percent Hispanic" , "Percent Asian" ),
      selected = "Percent White"
    ),
      sliderInput(
        "slider",
        label = "Range of interest to display :",
        min = 0,
        max = 100,
        value = c(0,100)
    )
    
  ),
  card(plotOutput("map"))
)

    

# Define server logic required to draw a histogram ---
server <- function(input, output) {
  output$map <- renderPlot({
    data <- switch(input$var,
                   "Percent White" = counties$white,
                   "Percent Black" = counties$black,
                   "Percent Hispanic" = counties$hispanic,
                   "Percent Asian" = counties$asian)
    
    color <- switch(input$var,
                    "Percent White" = "darkgreen",
                    "Percent Black" = "black",
                    "Percent Hispanic" = "darkorange",
                    "Percent Asian" = "darkviolet")
    
    legend <- switch(input$var,
                     "Percent White" = "% White",
                     "Percent Black" = "% Black",
                     "Percent Hispanic" = "% Hispanic",
                     "Percent Asian" = "% Asian")
    
    percent_map(data, color, legend, input$slider[1], input$slider[2])
  })
}




# Run the application 
shinyApp(ui = ui, server = server)

