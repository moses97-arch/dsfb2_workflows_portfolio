library(tidyverse)
library(readxl)

c_elegans_population <- read_excel(here::here(
  "data_raw",
  "CE.LIQ.FLOW.062_Tidydata.xlsx"
), sheet = 1,)


## Check if data was imported correctly
str(c_elegans_population)

## compConcentration is a chr column instead of a numeric column -> convert to numeric
c_elegans_population$compConcentration <- as.numeric(c_elegans_population$compConcentration)

## Generate scatter plot for different chemicals and concentrations
c_elegans_population %>%
  ggplot(aes(x = log10(compConcentration), y = RawData)) +
  geom_point(aes(color = compName, shape = expType)) + 

