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

# load table of variable names, labels
v18 <- load_variables(2018, "acs5", cache = TRUE)

state_pop <- get_acs(
  geography = "state",
  variables = c("Total Population" = "B01003_001"),
  year = 2018,
  survey = "acs5")

state_pop <- state_pop %>% 
  rename(name = NAME,
         geoid = GEOID)

wa_pop <- state_pop %>% 
  filter(name == 'Washington')

county_pop <- get_acs(
  geography = "county", 
  variables = c("Total Population" = "B01003_001"),
  year = 2018,
  survey = "acs5") 

county_pop <- county_pop %>% 
  rename(name = NAME,
         geoid = GEOID)

county_pop$name <- tolower(county_pop$name)
  
county_pop <- county_pop %>%
  separate(geoid, 
           c("geoid_state", 
             "geoid_county"), 
           sep = 2,
           remove = FALSE
           )

wa_counties <- county_pop %>% 
  filter(geoid_state == 53)

wa_pop <- bind_rows(wa_counties, wa_pop)

wa_pop$name <- tolower(wa_pop$name)

outputfile <- here('county-pop', 'output', 'county-pop.csv')
write_csv(county_pop, outputfile)

outputfile <- here('county-pop', 'output', 'state-pop.csv')
write_csv(state_pop, outputfile)

outputfile <- here('county-pop', 'output', 'wa-pop.csv')
write_csv(wa_pop, outputfile)
