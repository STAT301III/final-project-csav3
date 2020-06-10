# load in data
library(tidyverse)

hdi_dat <- read_csv("data/unprocessed/HDI.csv")

# country, HDI rank, HDI, life expectancy, mean years of schooling, total unemployment,
# Internet users

# the dataset is 82 columns, so extract the 7 needed for analysis plus a couple more
# (gender development index and population) that I believe are significant in 
# contextualizing the human development rankings
hdi_dat <- hdi_dat[, c(3:7, 15, 29, 60, 68)]

# inspect for missing values
skimr::skim_without_charts(hdi_dat)

# I will remove missing values only from the columns that I will actually perform analyses
# on, in order to retain as many countries from the original dataset as possible.
hdi_dat <- hdi_dat[!is.na(hdi_dat$HDI), ]
hdi_dat <- hdi_dat[!is.na(hdi_dat$`HDI Rank`), ]
hdi_dat <- hdi_dat[!is.na(hdi_dat$`Life expectancy`), ]
hdi_dat <- hdi_dat[!is.na(hdi_dat$`Mean years of schooling`), ]
hdi_dat <- hdi_dat[!is.na(hdi_dat$`Total Unemployment (% of labour force) 2015`), ]
hdi_dat <- hdi_dat[!is.na(hdi_dat$`Internet users`), ]

# 18 countries have been removed from the dataset.

# I will now rename some of the columns for increased clarity and consistency. I will
# also eliminate spaces in column names. This will make handling variables easier later on.
colnames(hdi_dat)[2] <- "HDI_Rank"
colnames(hdi_dat)[4] <- "Life_Expectancy"
colnames(hdi_dat)[5] <- "Mean_Years_of_Schooling"
colnames(hdi_dat)[6] <- "Gender_Development_Index"
colnames(hdi_dat)[7] <- "2015_Population"
colnames(hdi_dat)[8] <- "2015_Total_Unemployment_Rate"
colnames(hdi_dat)[9] <- "Internet_Users"

# I will also rename some of the countries. Some countries are formatted strangely; for example,
# one of the countries is 'Korea (Republic of).' It is not clear if this is North or South
# Korea, and the placement of the phrase 'Republic of' at the end is not very intuitive.
hdi_dat[12, "Country"] <- "Hong Kong"
hdi_dat[17, "Country"] <- "South Korea"
hdi_dat[29, "Country"] <- "Brunei"
hdi_dat[47, "Country"] <- "Russia"
hdi_dat[64, "Country"] <- "Iran"
hdi_dat[67, "Country"] <- "Venezuela"
hdi_dat[75, "Country"] <- "Macedonia"
hdi_dat[99, "Country"] <- "Moldova"
hdi_dat[106, "Country"] <- "Palestine"
hdi_dat[107, "Country"] <- "Vietnam"
hdi_dat[110, "Country"] <- "Bolivia"
hdi_dat[128, "Country"] <- "Laos"
hdi_dat[139, "Country"] <- "Syria"
hdi_dat[141, "Country"] <- "Tanzania"
hdi_dat[166, "Country"] <- "Congo"

# the data has been sufficiently processed. All of the variables are of the correct
# type (1 character and 8 numeric), missingness has been dealt with, and certain column/country 
# names have been properly renamed.

# Finally, write the tidied data to an rds file.
write_rds(hdi_dat, "data/processed/hdi_dat.rds")

