#ui
library(shiny)
library(dplyr)
library(plotly)

shinyUI(fluidPage(
  # UI for the iris data
  titlePanel('A Rose, by any other name, is an Iris'),
  
  # Controls
  sidebarLayout(
    sidebarPanel( 
      #For selecting the species
      radioButtons("species", label = h3("Choose Species"),
                    choices = list("Setosa" = "setosa", "Versicolor" = "versicolor", 
                                   "Virginica" = "virginica", "All" = "all"),
                    selected = "all"),
      #for selecting the x axis
      selectInput("x_axis", label = h3("Select X Axis"), 
                  choices = list("Petal Length" = "Petal.Length", "Petal Width" = "Petal.Width"), 
                  selected = "Petal.Length"),
      #for selecting the y axis
      selectInput("y_axis", label = h3("Select Y Axis"), 
                  choices = list("Sepal Length" = "Sepal.Length", "Sepal Width" = "Sepal.Width"), 
                  selected = "Sepal.Length")
    ),
    # Render plot
    mainPanel(
      plotlyOutput("scatter")
    )
  )
))

