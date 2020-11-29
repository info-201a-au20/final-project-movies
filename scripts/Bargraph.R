# Bar Graph
# Load relevant packages
library(dplyr)
library(ggplot2)
library(stringr)
library(plotly)

# Creating a bar graph of average movie industry revenue over the years
# using the usa_gross_revenue field
# My function that returns the graph
get_bar_graph <- function(dataframe) {
  # First wrangle the dataframe to get the values I want
  dataframe <- dataframe %>%
    mutate("revenue" = as.numeric(
      str_sub(usa_gross_income, 2, nchar(usa_gross_income))
    )) %>%
    group_by(year) %>%
    summarise("average_revenue" = mean(revenue, na.rm = TRUE))
  bar_graph <- ggplot(data = dataframe) +
    geom_col(data = dataframe, aes(x = year, y = average_revenue), fill = "deepskyblue") +
    xlab("Year") +
    ylab("Average Revenue (USD)") +
    ggtitle("Average Revenue of Movie Industry by Year (1990 - 2020)")

  return(bar_graph)
}
