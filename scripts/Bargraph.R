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
    suppressWarnings(
    mutate("revenue" = as.numeric(
      str_sub(usa_gross_income, 2, nchar(usa_gross_income))
    ))) %>%
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

build_bar_graph <- function(dataframe, measurement, year_list) {
  # make min and max x year values from slider
  xmin <- as.numeric(year_list[1])
  xmax <- as.numeric(year_list[2])

  # Create a better formatted version of the title
  y_title <- str_to_title(str_replace_all(measurement, "_", " "))

  # Create a dataframe that only takes values from specific years
  new_dataframe <- suppressWarnings(dataframe %>%
    filter(year >= xmin, year <= xmax) %>%
    mutate("revenue" = as.numeric(
      str_sub(usa_gross_income, 2, nchar(usa_gross_income)))) %>%
    mutate("budget" = as.numeric(
      str_sub(budget, 2, nchar(budget)))) %>%
    group_by(year) %>%
    # The main metrics we will be measuring
    summarise("average_revenue" = mean(revenue, na.rm = TRUE),
              "median_revenue" = median(revenue, na.rm = TRUE),
              "total_revenue" = sum(revenue, na.rm = TRUE),
              "average_budget" = mean(budget, na.rm = TRUE),
              "median_budget" = median(budget, na.rm = TRUE),
              "total_budget" = sum(budget, na.rm = TRUE)
    ))

  # Create the Bar Graph
  # Suppress Warnings
  bar_graph <- suppressWarnings(
    ggplotly(
    ggplot(data = new_dataframe) +
    geom_col(data = new_dataframe, aes(x = year,
             y = !!ensym(measurement),
             # This is the text for the tooltip
             text = paste0(y_title, ": $", round(!!ensym(measurement)), 2,
                           "<br> Year: ", year)),
             fill = "firebrick") +
    # Scale graph to only include years of interest
    xlim(xmin - 1, xmax + 1) +
    # Add labels and Title
    xlab("Year") +
    ylab(paste0(y_title, " (USD)")) +
    ggtitle(paste0(y_title, " (USD) of Movie Industry by Year
                              (", xmin, " - ", xmax, ")")) +
    # Add vertical lines to signify the years of interest
    geom_vline(xintercept = 1991, linetype = "dotted", color = "white") +
    geom_vline(xintercept = 1997, linetype = "dotted", color = "white") +
    geom_vline(xintercept = 2001, linetype = "dotted", color = "white") +
    geom_vline(xintercept = 2005, linetype = "dotted", color = "white") +
    geom_vline(xintercept = 2008, linetype = "dotted", color = "white") +
    geom_vline(xintercept = 2020, linetype = "dotted", color = "white"),
    tooltip = "text")
)
  return(bar_graph)
}
