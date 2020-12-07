# Page One : Overview

intro_page <- tabPanel(
  title = "About",
  fluidPage(
    # Image
    tags$img(id = "cropped_image",
             src = "movietheater.png", alt = "Image of Movie Theater")
    # includeHTML("intro_page.html")
    
  )
)
# Image source:
# https://consequenceofsound.net/2015/06/whats-your-most-memorable-moviegoing-experience/

