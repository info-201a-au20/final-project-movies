# App server

# Load Libraries
library("ggplot2")
library("dplyr")
library("tidyr")
source("app_ui.R")

# Sourcing our /scripts files
source("./scripts/Bargraph.R")
source("./scripts/linegraph_GT.R")
source("./scripts/Scatterplot.R")
source("./scripts/summary_table_function.R")


# Sourcing our dataframes
df <- read.csv("./data/midpoint_df.csv", stringsAsFactors = FALSE)
google_trend_df <- read.csv("data/google_trends_df.csv",
                            stringsAsFactors = FALSE)

# Defining Shiny server
server <- function(input, output) {

  # Render a plotly object returning the scatter plot (interactive chart 1)
  output$scatter <- renderPlotly({
    scatter <- build_scatterplot(df, input$genre_var)
    return(scatter)
  })

  # Render a plotly object returning the bar chart (interactive chart 2)
  output$bar <- renderPlotly({
    bar <- build_bar_graph(df, input$measurement, input$year_slider)
    return(bar)
  })

  # Render a plotly object returning the line chart (interactive chart 3)

  # Experiement
  output$sliderexp <- renderText({
    message <- paste("range is from", input$slider[1], "to", input$slider[2],
                     "also", input$quarantine_button)
    return(message)
  })
  # Line chart here
  output$linegraph <- renderPlotly({
    line <- build_line_graph(google_trend_df, input$slider,
                             input$quarantine_button)
    return(line)
  })
  
  # Table
  output$genre_table <- renderTable({
    result <- (build_genre_table(df)) %>%
      rename(
        "Year" = "year",
        "Most Common Genre" = "common_genre",
        "Least Common Genre" = "least_genre"
        )
    })
  
  # Budget Graph
  output$budget_table <- renderTable({
    build_budget_table(df) %>%
      rename(
        "Year" = "year",
        "Average Budget ($)" = "avg_budget"
      )
  })

}
