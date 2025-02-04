# App.R
# Load libraries
library("shiny")
library("ggplot2")
library("plotly")
library("dplyr")
library("tidyr")
library("shinythemes")
library("shinyBS")
library("knitr")
# Source ui and server
source("app_server.R")
source("app_ui.R")

# Load App
shinyApp(ui = ui, server = server)
