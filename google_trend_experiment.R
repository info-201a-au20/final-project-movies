# Google trend data amalgamation and play around with charts

# Load the libraries
library("dplyr")
library("ggplot2")
library("zoo")

# Load the datasets
load_data <- function(movie_name) {
  data <- read.csv(paste0("data/google_trends/", movie_name, "_GT.csv"), stringsAsFactors = FALSE)
  return(data)
}

contagion <- load_data("contagion")
carriers <- load_data("carriers")
containment <- load_data("containment")
I_am_legend <- load_data("I_am_legend")
outbreak <- load_data("outbreak")
pandemic <- load_data("pandemic")
quarantine <- load_data("quarantine")
X28_days_later <- read.csv("data/google_trends/28_days_later.csv", stringsAsFactors = FALSE)



# Make the data usable
usable <- function(df) {
  df$Month <- row.names(df)
  row.names(df) <- 1:length(df$Month)
  colnames(df) <- c("Search_Interest", "Month")
  df <- df[-1,]
  df$Month <- as.yearmon(df$Month, "%Y-%m")
  df$Search_Interest <- as.numeric(df$Search_Interest)
  return(df)
}

contagion <- usable(contagion)
colnames(contagion) <- c("Contagion", "Month")

carriers <- usable(carriers)
colnames(carriers) <- c("Carriers", "Month")

containment <- usable(containment)
colnames(containment) <- c("Containment", "Month")

I_am_legend <- usable(I_am_legend)
colnames(I_am_legend) <- c("I_am_legend", "Month")

outbreak <- usable(outbreak)
colnames(outbreak) <- c("Outbreak", "Month")

pandemic <- usable(pandemic)
colnames(pandemic) <- c("Pandemic", "Month")

quarantine <- usable(quarantine)
colnames(quarantine) <- c("Quarantine", "Month")

X28_days_later <- usable(X28_days_later)
colnames(X28_days_later) <- c("X28_days_later", "Month")


# Combine the data
google_trends <- left_join(I_am_legend, contagion, by = "Month") %>% 
  left_join(., X28_days_later, by = "Month") %>% 
  left_join(., quarantine, by = "Month") %>% 
  left_join(., carriers, by = "Month")



google_trend_df <- read.csv("data/google_trends_df.csv", stringsAsFactors = FALSE)
# Create a line graph
ggplot(data = google_trend_df, aes(x = Month)) +
  geom_line(mapping = aes(y = I_am_legend, color = "I am Legend")) +
  geom_line(mapping = aes(y = Contagion, color = "Contagion")) +
  geom_line(mapping = aes(y = X28_days_later, color = "28 Days Later")) +
  geom_line(mapping = aes(y = Quarantine, color = "Quarantine")) +
  geom_line(mapping = aes(y = Carriers, color = "Carriers")) +
  scale_color_manual("",
                     values = c("I am Legend" = "green",
                                "Contagion" = "red",
                                "28 Days Later" = "blue",
                                "Quarantine" = "orange",
                                "Carriers" = "purple")) +
  labs(
    title = "Search interest of Pandemic Related Movies Relative to the Highest Point on the Chart for their Given Time Frame",
    x = "Month",
    y = "Search interest relative to the highest point on the chart"
  )


google_trend_df$Month <- as.yearmon(google_trend_df$Month, "%b %Y")

class(google_trend_df$Month)  
  
  