#server
iris_data <- iris
library(dplyr)
library(plotly)
library(shiny)

shinyServer(function(input, output) {
  output$scatter <- renderPlotly({
     #make plot of data
     #this checks to see what species the user wants to display and gathers the correct data
     if(input$species != "all") {
       iris_data <- iris_data %>% filter(Species == input$species)
     } 
     #these select the correct columns that the user wants to display
     x_options <- iris_data %>% select(contains(input$x_axis))
     y_options <- iris_data %>% select(contains(input$y_axis))
     #this part gets the right columns from the selected data
     Petal <- x_options[,1]
     Sepal <- y_options[,1]
     #this helps manage the changes axis names
     if(input$x_axis == "Petal.Length") {
       x_name <- "Petal Length"
     } else {
       x_name <- "Petal Width"
     }
     
     x <- list(title = x_name)
     
     if(input$y_axis == "Sepal.Length") {
       y_name <- "Sepal Length"
     } else {
       y_name <- "Sepal Width"
     }
     
     y <- list(title = y_name)
     #plotting the data with the right columns, species, title, and labels
     plot_ly(data = iris_data, x = Petal, y = Sepal, mode = "markers", color = Species) %>%
       layout(title = paste("Species:", input$species, sep = " "), xaxis = x, yaxis = y)
  })
})
