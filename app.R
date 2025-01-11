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


# Define UI for app that draws a histogram ----
ui <- page_sidebar(
  title = "censusVis",
  sidebar = sidebar(
    helpText("Create demagraphic maps with information from the from the US 2010 consensus"),
    selectInput(
      "select",
      label = "Choose variable to display",
      choices = list("Percent White", "Percent Black" , "Percent Hispanic" , "Percent Asian" ),
      selected = "Percent White"
    ),
      sliderInput(
        "slider",
        label = "Range of interest to display",
        min = 0,
        max = 100,
        value = c(0,100)
    )
    
  )
)

    
  
  

  
  
  
  
  
  








# Define server logic required to draw a histogram ---
server <- function(input, output) {
  
}



# Run the application 
shinyApp(ui = ui, server = server)

