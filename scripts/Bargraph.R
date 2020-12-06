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
    geom_col(data = dataframe, aes(x = year,
            y = average_revenue), fill = "deepskyblue") +
    xlab("Year") +
    ylab("Average Revenue (USD)") +
    ggtitle("Average Revenue of Movie Industry by Year (1990 - 2020)")

  return(bar_graph)
}
#df <- read.csv("../data/midpoint_df.csv", stringsAsFactors = F)
build_bar_graph <- function(dataframe = df, measurement){
  mutate("revenue" = as.numeric(
    str_sub(usa_gross_income, 2, nchar(usa_gross_income)))) %>%
    mutate("budget" = as.numeric(
      str_sub(budget, 2, nchar(budget)))) %>%
    group_by(year) %>%
    summarise("average_revenue" = mean(revenue, na.rm = TRUE),
              "median_revenue" = median(revenue, na.rm = TRUE),
              "total_revenue" = sum(revenue, na.rm = TRUE),
              "average_budget" = mean(budget, na.rm = TRUE),
              "median_budget" = median(budget, na.rm = TRUE),
              "total_budget" = sum(budget, na.rm = TRUE)
              )
  bar_graph <- ggplot(data = dataframe) +
    geom_col(data = dataframe, aes_string(x = "year",
                                   y = measurement), fill = "deepskyblue") +
    xlab("Year") +
    ylab(paste0(measurement, " (USD)")) +
    ggtitle(paste0(measurement, " (USD) of Movie Industry by Year (1990 - 2020)"))
  
  return(bar_graph)
}


#ggplotly(get_bar_graph(df))
