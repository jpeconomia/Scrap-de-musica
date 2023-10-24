install.packages("rvest")

library(rvest)
library(tidyverse)

# Escolhendo álbum dentro de algum período de tempo 

Ano <- sample(1980:1990,1)

Ano <- paste("https://rateyourmusic.com/charts/top/album/", 
             as.character(Ano), sep = "")

html <- read_html(Ano)

album <- html  %>% html_elements(paste("#pos",as.character(sample(1:40,1)), sep = "")) %>% 
       html_elements(".page_charts_section_charts_item_title") %>% 
  html_elements("a") %>% html_attr("href")

link <- paste("https://rateyourmusic.com",album, sep = "")

browseURL(link)

# olhando a página para os mais votados em geral

pag <- sample(1:5,1)
pag1 <- sample(seq(1+40*(pag-1),40+40*(pag-1)),1)

n <- paste("https://rateyourmusic.com/charts/top/album/all-time/deweight:live,archival,soundtrack/",
      as.character(pag), sep = "")

album <- read_html(n) %>% html_elements(paste("#pos",
                                              as.character(pag1), sep = "")) %>% 
  html_elements(".page_charts_section_charts_item_title") %>% 
  html_elements("a") %>% html_attr("href")
  
link <- paste("https://rateyourmusic.com",album, sep = "")

browseURL(link)


# procurando para algum gênero específico

pag <- sample(1:5,1)
pag1 <- sample(seq(1+40*(pag-1),40+40*(pag-1)),1)

n <- paste("https://rateyourmusic.com/charts/top/album/all-time/g:pop/",
           as.character(pag), sep = "")

album <- read_html(n) %>% html_elements(paste("#pos",
                                              as.character(pag1), sep = "")) %>% 
  html_elements(".page_charts_section_charts_item_title") %>% 
  html_elements("a") %>% html_attr("href")

link <- paste("https://rateyourmusic.com",album, sep = "")

browseURL(link)

  


