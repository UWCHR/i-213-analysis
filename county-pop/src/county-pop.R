# Authors:     PN
# Maintainers: PN
# Copyright:   2021, UWCHR, GPL v2 or later
# =========================================
# ice-213-analysis/county-pop/src/county-pop.R

library(tidyverse)
library(tidycensus)
library(here)
library(assertr)

# install census api key
# census_api = Sys.getenv("CENSUS_API_KEY")
# census_api_key(census_api, install=TRUE)

# return data frame of geographical unit identifier and descriptive name
df_counties <- get_acs(
  geography = "county", 
  variables = c("Total Population" = "B01003_001"),
  year = 2018,
  survey = "acs5")

df_counties <- df_counties %>% 
  rename(name = NAME,
         geoid = GEOID)

# standardize variable names
df_counties$name <- tolower(df_counties$name)
  
# separate geoid into state and county identifiers
df_counties <- df_counties %>%
  separate(geoid, 
           c("geoid_state", 
             "geoid_county"), 
           sep = 2,
           remove = FALSE
           )

# Writing out county to AOR mapping
outputfile <- here('county-pop', 'output', 'county-pop.csv')
write_csv(df_counties, outputfile)
