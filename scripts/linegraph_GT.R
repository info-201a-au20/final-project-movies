# Line Graph function that returns the search interest of 5 pandemic related
# movies relative to the highest point on the chart for their given time frame

# Import Libraries
library("dplyr")
library("ggplot2")
library("zoo")

# Create the function to make a line graph of the google trends data
get_line_graph_gt <- function(df) {
  # Make sure the data has the months as class yearmon
  df$month <- as.yearmon(df$month, "%b %Y")
  # Create the line graph
  line_graph <- ggplot(data = df, aes(x = month)) +
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
         x = "month",
         y = "Search interest relative to the highest point on the chart")
  return(line_graph)
}

build_line_graph <- function(df, input_slider) {
  
  # make min and max x year values from slider
  xmin <- input_slider[1]
  xmax <- input_slider[2]
  
  # Data has months as class year mon
  df$month <- as.yearmon(df$month, "%b %Y")
  
  # Create the line graph
  line_graph <- ggplot(data = df, aes(x = month)) +
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
    labs(
      title = "Search interest of Pandemic Related Movies",
      x = "Month",
      y = "Search interest relative to the highest point on the chart"
    ) +
    # Set the interactive x axis
    scale_x_yearmon(
      limits = c(as.yearmon(paste0("Jan ", xmin), "%b %Y"),
                 as.yearmon(paste0("Dec ", (xmax-1), "%b %Y"))
      )
    ) 
  
  return(line_graph)
  
}
