# App server

# Load Libraries
library("ggplot2")
library("dplyr")
library("tidyr")

# Sourcing our /scripts files
source("./scripts/summary_info.R")
source("./scripts/summary_table_function.R")
source("./scripts/Bargraph.R") 
source("./scripts/linegraph_GT.R")
source("./scripts/Scatterplot.R")

# Sourcing our dataframes
df <- read.csv("./data/midpoint_df.csv", stringsAsFactors = FALSE)
google_trend_df <- read.csv("data/google_trends_df.csv", 
                            stringsAsFactors = FALSE)

# Defining Shiny server
server <- function(input, output) {
  
  # Render a plotly object returning the scatter plot (interactive chart 1)
  output$scatter <- renderPlotly({
    scatter <- build_scatter(joined_data, input$search_var)
    return(scatter)
  })
  
  
  # Render a plotly object returning the bar chart (interactive chart 2)
  
  
  
  # Render a plotly object returning the line chart (interactive chart 3)
  
}