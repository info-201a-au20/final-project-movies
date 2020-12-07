# Summary Page
summary_page <- tabPanel(
  title = "Insights and Summary",
  # tags$style(type = 'text/css',
  #            HTML('
  #            .navbar { background-color: #8d0817;}
  #            .navbar-default .navbar-brand{color: white;}
  #            .navbar-default .navbar-nav > .active > a
  #            .navbar-default .navbar-nav > .active > a:focus {color: white;
  #                       background-color: #da3f52;}
  #                 ')
  # ),
  #tags$style(
  #   HTML(".tabs-above > .nav > li[class=active] > a {
  #          background-color: #8d0817;
  #          color: #FFF;}")
  # ),
  fluidPage(
    includeCSS("styling.css"),
    titlePanel(tags$h1("Insights")),
    p("Click on the words below to view insights based on our project"),
    bsCollapse(
      bsCollapsePanel("Genre Insights", includeHTML("insight_one.html")),
      bsCollapsePanel("Budget Insights", includeHTML("insight_two.html")),
      bsCollapsePanel(
        "Significant Events Insights",
        bsCollapsePanel(
          "1991 - Introduction of the Internet",
          includeHTML("insight_1991.html")
          ),
        bsCollapsePanel(
          "1997 - Creation of Netflix",
          includeHTML("insight_1997.html")
          ),
        bsCollapsePanel(
          "2001 - 9/11 Attacks",
          includeHTML("insight_2001.html")
          ),
        bsCollapsePanel(
          "2005 - Creation of Youtube",
          includeHTML("insight_2005.html")
          ),
        bsCollapsePanel(
          "2008 - The Great Recession",
          includeHTML("insight_2008.html")
          ),
        bsCollapsePanel(
          "2020 - COVID-19 Pandemic",
          includeHTML("insight_2020.html")
          )
        )
      )
    )
  )