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
ui <- page_fluid(
  titlePanel("Basic Widgets"),
  layout_columns(
    col_widths = 3,
    card(
      card_header( "Buttons"),
      actionButton("action", "Action"),
      submitButton("Submit"),
    ),
    card(
      card_header("Single checkbox"),
      checkboxInput("checkbox", "Choice A", value = TRUE),
      checkboxInput("checkbox", "Choice B", value = FALSE)
    ),
    
    card(
      card_header("Checkbox group"),
      checkboxGroupInput(
        "checkGroup",
        "Select all that apply",
        choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3),
        selected = 1
      ) 
      ),
    
  card(
    card_header("Date Input"),
    dateInput("date", "Select date", value = "2025-01-03")
  ),
  
  card(
    card_header("File input"),
    fileInput("file", label = NULL)
  ),
  
  card(
    card_header("Help Text"),
    helpText("Note: help isn't a real widget",
             "but it provides an easy way to add text to",
             "accompany other widgets")
    ),
  
  card(
    card_header("Numeric Input"),
    numericInput("num", "Input number", value = 1)
  ),
  
  card(
    card_header("Radio Buttons"),
    radioButtons(
      "radio", 
      "Select Option",
      choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3),
      selected = 3
      )
  ),
  
  card(
    card_header("Select Box"),
    selectInput(
      "select",
      "Select option",
      choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3),
      selected = 1
    )
  ),
  
  card(
    card_header("sliders"),
    sliderInput(
      "slider 1",
      "Set value",
      min = 0,
      max = 100,
      value = 50
    ),
    
    sliderInput(
      "slider 2",
      "Set value range",
      min = 0,
      max = 100,
      value = c(25, 75)
    )
  ),
  
  card(
    card_header("Text input"),
    textInput("text", label = NULL, value = "Enter text here...")
  ),
  
  card(
    card_header(" Date Range"),
    dateRangeInput( "dates", "Select dates")
  )
  
  
  
  
  
    )
  )








# Define server logic required to draw a histogram ---
server <- function(input, output) {
  
}



# Run the application 
shinyApp(ui = ui, server = server)

