# UI
library(shiny)
library(ggplot2)
library(plotly)

# First Page (introduction)


# Second Page (interactive chart 1)

# Creating a `sidebarPanel()` for the scatterplot page that contains a 
# `selectInput` widget for selecting a movie genre to plot
scatter_sidebar_content <- sidebarPanel(
  selectInput( # starting out with single input, may change to checkboxGroupInput
    inputId = "genre_var",
    label = "Select a movie genre: ",
    choices = list(
      # list out genre options
    )
  )
)

# Creating a `mainPanel()` for the scatterplot page that contains the
# `plotlyOutput()` of the scatter
scatter_main_content <- mainPanel(
  plotlyOutput("scatter")
)

# Creating a `tabPanel()` for the scatterplot page
scatter_panel <- tabPanel(
  "Scatterplot",
  
  # Adding a titlePanel to your tab
  titlePanel("Popularity of Individual Movie Genres From 1990-2020"),
  
  # Creating a sidebar layout for this tab (page)
  sidebarLayout(
    scatter_sidebar_content,
    scatter_main_content
    
  )
)   


# Third Page (interactive chart 2)


# Fourth Page (interactive chart 3)


# Fifth Page (summary)

# UI 
ui <- fluidPage(
  title = "Testing bar graph",
  plotlyOutput("bar"),
  tableOutput("table")
  #scatter_panel
)
