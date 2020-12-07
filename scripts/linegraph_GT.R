# Line Graph function that returns the search interest of 5 pandemic related
# movies relative to the highest point on the chart for their given time frame

# Import Libraries
library("dplyr")
library("ggplot2")
library("zoo")
library("plotly")   

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



build_line_graph <- function(df, input_slider, input_button) {
  
  # Determine xaxis values
  if(input_button == "zoom") {
    xmin <- 2019
    xmax <- 2021
  } else if(input_button == "slider") {
    xmin <- input_slider[1]
    xmax <- input_slider[2]
  }
  
  # Gathering the data to make it easier to wrangle
  new_gt_data <- df %>% 
    select(-X, -X.1) %>% 
    gather(key = "movie", value = "popularity", -month)
  
  # Changing Movie names to normal input 
  new_gt_data$movie[new_gt_data$movie == "X28_days_later"] <- "28 Days Later"
  new_gt_data$movie[new_gt_data$movie == "I_am_legend"] <- "I am Legend"
  
  # Turn months into yearmon class
  new_gt_data$month <- as.yearmon(new_gt_data$month, "%b %Y")
  
  # Creating a plot in a much more simpler way
  line_graph <- ggplot(data = new_gt_data) +
    geom_line(
      mapping = aes(x = month, y = popularity, colour = movie)
    ) +
    # Add in customizable x axis from slider data
    scale_x_yearmon(
      limits = c(as.yearmon(paste0("Jan ", xmin), "%b %Y"),
                 as.yearmon(paste0("Dec ", (xmax-1), "%b %Y"))
      )
    ) +
    # Add in a vertical line showcaseing the 2020 pandemic
    geom_vline(
      mapping = aes(xintercept = as.yearmon("Mar 2020", "%b %Y"))
    ) +
    # Add the text next to the vertical line to say this is when the pandemic 
    # was instated
    geom_text(
      mapping = aes(x = as.yearmon("Mar 2020", "%b %Y"),
                    y = 0, 
                    label = "US quarantine",
                    color = "#a9a9a9"),
      size=4, angle=90, vjust=-0.4, hjust=0) +
    # Add general title and x/y axis title 
    labs(
      title = "Search interest of Pandemic Related Movies",
      x = "Month",
      y = "Search Interest",
      color = "Movies"
    ) 
    
  return(line_graph)
  
}


