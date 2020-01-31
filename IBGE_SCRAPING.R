library(tidyverse)
library(rvest)
library(bizdays)
library(lubridate)
library(openxlsx)


### Link de referência dos dados

html_url <- "https://www.ibge.gov.br/estatisticas/economicas/industria/9294-pesquisa-industrial-mensal-producao-fisica-brasil.html?=&t=resultados"

html <- read_html(html_url)

#if(html.matrix !=  ){
#}

dados <- html %>%
  #//*[contains(concat( " ", @class, " " ), concat( " ", "table__scroll__container", " " ))]
  html_nodes(xpath = '//*[@id="table__scroll__container"]') %>%
  #html_nodes("tr") %>%
  html_text() %>%
  str_replace(",", ".") %>%
  as.character() %>%
  matrix(ncol = 6, nrow = 28) %>%
  as.data.frame()


## Gerar planilha em excel 
nome_arquivo <- paste0("L:/Area Macro/Base de Dados/Temp/Thiago/", "(", Sys.Date(), ") ", "Dados_IBGE.xlsx")
write.xlsx(x = dados, file = nome_arquivo)


