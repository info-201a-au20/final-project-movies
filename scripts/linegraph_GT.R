# Line Graph function that returns the search interest of 5 pandemic related
# movies relative to the highest point on the chart for their given time frame

# Import Libraries
library("dplyr")
library("ggplot2")
library("zoo")

# Create the function to make a line graph of the google trends data
get_line_graph_GT <- function(df) {
  # Make sure the data has the months as class yearmon
  df$Month <- as.yearmon(df$Month, "%b %Y")
  
  # Create the line graph
  line_graph <- ggplot(data = df, aes(x = Month)) +
    geom_line(mapping = aes(y = I_am_legend, color = "I am Legend")) +
    geom_line(mapping = aes(y = Contagion, color = "Contagion")) +
    geom_line(mapping = aes(y = X28_days_later, color = "28 Days Later")) +
    geom_line(mapping = aes(y = Quarantine, color = "Quarantine")) +
    geom_line(mapping = aes(y = Carriers, color = "Carriers")) +
    scale_color_manual(
      "",
      values = c(
        "I am Legend" = "green",
        "Contagion" = "red",
        "28 Days Later" = "blue",
        "Quarantine" = "orange",
        "Carriers" = "purple"
      )
    ) +
    labs(title = "Search interest of Pandemic Related Movies",
         x = "Month",
         y = "Search interest relative to the highest point on the chart")
  
  return(line_graph)
}


