library(tidyverse)
library(rvest)
library(bizdays)
library(lubridate)


#### Carregar dados ####

html_url <- "https://www.ibge.gov.br/estatisticas/economicas/industria/9294-pesquisa-industrial-mensal-producao-fisica-brasil.html?=&t=resultados"

html <- read_html(html_url)

dados <- html %>%
  html_nodes("tr") %>%
  html_text() %>%
  str_replace(",", ".") %>%
  as.numeric() %>%
  matrix(ncol = 6, byrow = TRUE) %>%
  as.data.frame()


