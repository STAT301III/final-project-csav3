# EDA code/scratchwork

# load in data
library(tidyverse)

hdi_dat <- read_csv("data/unprocessed/HDI.csv")

#remove columns not needed for now
hdi_dat <- hdi_dat[, -c(1:2)] 
                        
# hdi rank investigation
skimr::skim_without_charts(hdi_dat)
sum(is.na(hdi_dat))

median(na.omit(hdi_dat$`HDI Rank`))

skimr::skim_without_charts(hdi_dat$`HDI Rank`)

summary(hdi_dat$`HDI Rank`)

sd(hdi_dat$`HDI Rank`, na.rm = TRUE)

boxplot(hdi_dat$`HDI Rank`)

# unemployment rate investigation

skimr::skim_without_charts(hdi_dat$`Total Unemployment (% of labour force) 2015`)
summary(hdi_dat$`Total Unemployment (% of labour force) 2015`)

# iqr = 6.4

#higher outlier: greater than 11.05 + (1.5 x 6.4) -> 20.65
  hdi_dat %>%
    filter(`Total Unemployment (% of labour force) 2015` > 20.65)
  # boxplot confirms this
  boxplot(hdi_dat$`Total Unemployment (% of labour force) 2015`)
# lower outlier: less than 4.6 - (1.5 x 6.4) -> -5 
  # none

sd(hdi_dat$`Total Unemployment (% of labour force) 2015`, na.rm = TRUE) 

# mean years of schooling investigation
skimr::skim_without_charts(hdi_dat$`Mean years of schooling`)
summary(hdi_dat$`Mean years of schooling`)

# iqr = 5.05

boxplot(hdi_dat$`Mean years of schooling`)

# no outliers

sd(hdi_dat$`Mean years of schooling`, na.rm = TRUE)

# life expectancy investigation
skimr::skim_without_charts(hdi_dat$`Life expectancy`)
summary(hdi_dat$`Life expectancy`)

# iqr = 11.45

boxplot(hdi_dat$`Life expectancy`)

sd(hdi_dat$`Life expectancy`, na.rm = TRUE)

# Internet users investigation
skimr::skim_without_charts(hdi_dat$`Internet users`)
summary(hdi_dat$`Internet users`)

boxplot(hdi_dat$`Internet users`)

# iqr = 51.25

sd(hdi_dat$`Internet users`, na.rm = TRUE)

# relationship between HDI Rank and mean years of schooling

cor(hdi_dat$`HDI Rank`, hdi_dat$`Mean years of schooling`, method = "pearson", use = 'complete.obs')

# relationship between HDI and life expectancy

cor(hdi_dat$`HDI Rank`, hdi_dat$`Life expectancy`, method = "pearson", use = 'complete.obs')

# relationship between Unemployment rate and Internet users

cor(hdi_dat$`Total Unemployment (% of labour force) 2015`, hdi_dat$`Internet users`, method = "pearson", use = 'complete.obs')

# relationship betwewn Q1 predictors

cor(hdi_dat$`Life expectancy`, hdi_dat$`Mean years of schooling`, method = "pearson", use = 'complete.obs')

summary(hdi_dat$`Life expectancy`)

summary(hdi_dat$`Mean years of schooling`)

# Women in parliament findings

skimr::skim_without_charts(hdi_dat$`Share of seats in parliament (% held by women)`)
summary(hdi_dat$`Share of seats in parliament (% held by women)`)

boxplot(hdi_dat$`Share of seats in parliament (% held by women)`)

# Mean years of schooling - M & F findings

skimr::skim_without_charts(hdi_dat$`Mean years of schooling Female`)
summary(hdi_dat$`Mean years of schooling Female`)

skimr::skim_without_charts(hdi_dat$`Mean years of schooling Male`)
summary(hdi_dat$`Mean years of schooling Male`)

boxplot(hdi_dat$`Mean years of schooling Female`)
boxplot(hdi_dat$`Mean years of schooling Male`)
