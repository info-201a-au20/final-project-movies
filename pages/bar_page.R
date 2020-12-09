# Bar Chart Page
library(shiny)

# going to be focusing on budget and gross revenue
# users have the option of choosing between looking at
# the average, median, and total for budget or revenue

# Create the options for the input in the sidebar
measurement_list <- list(
  "Average Budget" = "average_budget",
  "Median Budget" = "median_budget",
  "Total Budget" = "total_budget",
  "Average Revenue" = "average_revenue",
  "Median Revenue" = "median_revenue",
  "Total Revenue" = "total_revenue"
)

# create the selectInput
measurement_input <- selectInput(
  inputId = "measurement",
  label = "Metric",
  choices = measurement_list,
  selected = "Average Budget"
)

# create the slider for the year
year_slider <- sliderInput(
    inputId = "year_slider",
    label = "Years",
    min = 1990,
    max = 2020,
    value = c(1990, 2020),
    round = TRUE,
    dragRange = TRUE,
    # Remove the comma
    sep = ""
  )

# Create the sidebar panel
bar_sidebar_panel <- sidebarPanel(
  inputId = "bar_sidebar",
  measurement_input,
  year_slider
)

# Create the main panel
bar_main_panel <- mainPanel(
  # Plot the chart
  suppressWarnings(plotlyOutput("bar")),

  # Write the description, use tags to include the css styles
  tags$h2("About Chart:"),
  tags$p("One of the questions we wanted to answer
  with our data was how different national and global events impacted the movie
  industry. To answer this, this graph looks at the numbers for the money that
  is brought in and spent by the movie industry by year. To do this, the graph
  looks at three main values (average, median, and total) for either budget or
  revenue. The graph also has the option of specifiying a date range, to look
  at the impact of events of specific years on the movie industry. The
  significant years and events that we looked at are shown by a dotted white
  line, and depict the years: 1991 (Introduction of the
  Internet), 1997 (Creation of Netflix), 2001 (9/11), 2005 (Creation of
  Youtube), 2008 (Great Recession), and 2020 (Coronavirus Pandemic)")
)

# Create the actual page to go in the UI
bar_page <- tabPanel(
  "Finance",
  fluidPage(
    includeCSS("styling.css"),
    titlePanel(
      tags$h1("How Did Different Global Events Effect
              the Finances of the Movie Industy?")),
    suppressWarnings(sidebarLayout(
      bar_sidebar_panel,
      bar_main_panel
    )),
    # add in the footer
    tags$footer(tags$p(
      "Gisele Fox, Emiri Nishizawa, Melina Perraut, Roshni Srikanth,
    Ha Nhat To: ",
      tags$a(id = "url",
             href = "https://github.com/info-201a-au20/final-project-movies",
             "Github URL")))
  )
)
