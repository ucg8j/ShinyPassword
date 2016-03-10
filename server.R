library(shiny)
library(datasets)
Logged = FALSE;
PASSWORD <- data.frame(Brukernavn = "withr", Passord = "25d55ad283aa400af464c76d713c07ad")
# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
  source("www/Login.R",  local = TRUE)
  
  observe({
    if (USER$Logged == TRUE) {
      output$obs <- renderUI({
        sliderInput("obs", "Number of observations:", 
                    min = 10000, max = 90000, 
                    value = 50000, step = 10000)
      })
      
      output$distPlot <- renderPlot({
        dist <- NULL
        dist <- rnorm(input$obs)
        hist(dist, breaks = 100, main = paste("Your password:", input$passwd))
      })
    }
  })
})
