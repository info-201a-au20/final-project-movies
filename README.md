# Final Project
Gisele Fox, Emiri Nishizawa, Melina Perraut, Roshni Srikanth, Ha Nhat To

## Domain of interest
All of the members in our group enjoy watching movies and are interested in the movie industry. We have also been witnessing the severe impact of the COVID-19 pandemic on the movie industry, from movie theater closures to film releases being delayed or pushed straight to streaming services. As a result, we are curious about the impact that global events - including the COVID-19 pandemic - have had on a variety of factors within the movie industry.

## Other data driven projects
- https://github.com/Srashti13/Movie-Data-set/blob/master/README.md (2019)

  - This is a project from a GitHub user named **Srashti13** to examine the components that make a movie successful, focusing on the top 100 Hollywood blockbusters. By using the data reflecting the first 18 years of the 21st century, retrieved from movie review websites (IMDB, Rotten Tomatoes, etc.) and movie-related organizations like National Association of Theatre Owners, the analyst was able to determine the average movie runtime and compare the top earning movies in US box office with the biggest earners by studios, genres and releasing years.

- http://rstudio-pubs-static.s3.amazonaws.com/342210_7c8d57cfdd784cf58dc077d3eb7a2ca3.html (2017)
  - This is a project from **Yueing Zhang** also to examine what drives the commercial success of a movie, but they looked at a much larger scope with a data set called IMDB 5000 (retrieved from Kaggle), containing information about over 5043 movies from 66 countries spanning for 100 years. They used IMDB scores of movies as the indicator of their performance. The data of other 27 variables were used to train an IMDB prediction model, some of which include the color or language of the movies, the directors, the acting crews and their influence on social media (Facebook), movie budgets, posters, etc.

- https://scholar.harvard.edu/tlan/box-office-prediction (2014)
https://github.com/lantian2012/DataScience
  - This is a project from a team of then Harvard CS and Statistics graduate students, **Tian Lan, Peiheng Hu, Xiaoan Wang**, looking into what compose of a good movie and question if box office is the only factor to determine one. Based on data from Rotten Tomatoes, IMDB and twitter, they gathered a large amount of information on US movies since the 1990s. Some of their conclusions were that the critics, audience and the box office favored different genres, but a positive correlation between critics and audiences ratings could still be found while no clear relationship was connected between box office and audience ratings. From the data they analyse, they built a model to predict the box office success of the top 10 movies in the first half of 2014 and reportedly got 80% accuracy.

## Data-driven questions
- How have movie box office earnings of movies released during global events (e.g. COVID pandemic, 2008 recession/Great Recession) been impacted by those events?
  - This question can be answered using data about movie box office earnings/profits and relating this data to the years that the movies were released.

- How have popular movie genres changed over the years, particularly during global events?
  - This question can be answered using and comparing data about the box office earnings of different genres of movies and how those earnings have changed over time.

- How has the popularity of previously released specific movies resurged during global events?
  - This question can be answered using data about the search trends of the movies’ titles or about the increase in revenue if the movies were released on streaming services or DVD following their theater release.


## Finding Data
**[The Movies Dataset:](https://www.kaggle.com/rounakbanik/the-movies-dataset?select=movies_metadata.csv)**
This dataset contains metadata of 45,000 movies, listed in the Full MovieLens Dataset, released before 2018. The data is collected from TMDB and GroupLens. It is hosted on Kaggle by Rounak Banik, along with other data csv files on credits, keywords, links and ratings. There are 24 features observed including budgets, genres, release dates, revenues, and languages. This data can be used to answer the first two questions. By combining our knowledge and research on global events, the impact on movies can be determined by the dataset. Considering the dataset includes information on genres, the second question can be answered by analyzing that feature alongside revenues and ratings.

**[IMDB 5000 Movie Dataset:](https://www.kaggle.com/carolzhangdc/imdb-5000-movie-dataset)**
There is no description provided by the author on how the data was collected, however, the title indicates that the information is from IMDB. The dataset is hosted on Kaggle by Yueming, a graduate student at Northeastern. There are 5,043 observations of 28 features including names of directors and actors, year, ratings, budgets, grosses, and Facebook likes. As with other datasets, by comparing to global event timelines, the impact on the movie industry can be analyzed. This information can add to the Movies Dataset by Rounak Banik, as similar data is explored.

**[IMDb Movies Extensive Database:](https://www.kaggle.com/stefanoleone992/imdb-extensive-dataset?select=IMDb+movies.csv)**
This data was scraped from the publicly available website IMDb.com using python scripts. It's hosted on Kaggle by Stefano Leone, a postgraduate student in data analytics at the National College of Ireland. In this dataset there are 85,855 observations of 22 features including title name, usa gross income, metascore ratings, and plot description. With this dataset, we can analyze the descriptions and genres of movies to see what kind of movies become more popular in the context of global events.

**[The Movie Industry Dataset:](https://www.kaggle.com/danielgrijalvas/movies)**
This dataset contains information about 6280 movies from 1986 to 2016. It was taken from IMDB, and hosted by Daniel Grikalvas on Kaggle, and was created to investigate movie revenue over time. It features observations across 15 different variables including budget, gross revenue, rating, and year, which are some of the variables we need to answer the questions. Using data from this dataset, we can determine how the budgets and earnings of movies were impacted by events like the 2008 recession, and the covid-19 pandemic.
