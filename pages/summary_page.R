# Summary Page
summary_page <- tabPanel(
  title = "Insights and Summary",
  fluidPage(
    includeCSS("styling.css"),
    HTML('<h1>Insights</h1>'),
    includeHTML("insight_one.html"),
    bsCollapse(
      bsCollapsePanel(
        "Click to view most and least common genre across years",
        tableOutput("genre_table")
      )
    ),
    includeHTML("insight_two.html"),
    bsCollapsePanel(
      "Click to view average budget across years",
      tableOutput("budget_table")
  ),
    HTML('<h2>Significant Events Insights</h2>'),
    bsCollapse(
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
    ),
  tags$footer(tags$p("Gisele Fox, Emiri Nishizawa, Melina Perraut, Roshni Srikanth, Ha Nhat To: ", 
                     tags$a(id = "url", href= "https://github.com/info-201a-au20/final-project-movies", "Github URL"))
              )
  )
)