install.packages("dplyr")
library(VennDiagram)
library(tidyverse)
library(dplyr)
library(ggplot2)

shopping <- read.csv(file = "projeto1/shopping.csv", sep=';' , dec=',')
shopping2 <- read.csv(file = "projeto1/shopping2.csv", sep=';' , dec=',')

summary(shopping)
summary(shopping2)

print(shopping)
print(shopping2)

hairFashion <- shopping2 %>% 
  dplyr::filter(shopping2$hair_fashion == 1) %>% 
  nrow()

chaveiro <- shopping2 %>% 
  dplyr::filter(shopping2$chaveiro == 1) %>% 
  nrow()

banco <- shopping2 %>% 
  dplyr::filter(shopping2$banco == 1) %>% 
  nrow()

barbearia <- shopping2 %>% 
  dplyr::filter(shopping2$barbearia == 1) %>% 
  nrow()

hairFashion_chaveiro <- shopping2 %>% 
  dplyr::filter(shopping2$chaveiro == 1 & shopping2$hair_fashion) %>% 
  nrow()

hairFashion_banco <- shopping2 %>% 
  dplyr::filter(shopping2$banco == 1 & shopping2$hair_fashion) %>% 
  nrow()

hairFashion_barbearia <- shopping2 %>% 
  dplyr::filter(shopping2$barbearia == 1 & shopping2$hair_fashion) %>% 
  nrow()

chaveiro_banco <- shopping2 %>% 
  dplyr::filter(shopping2$chaveiro == 1 & shopping2$banco) %>% 
  nrow()

chaveiro_barbearia <- shopping2 %>% 
  dplyr::filter(shopping2$chaveiro == 1 & shopping2$barbearia) %>% 
  nrow()

banco_barbearia <- shopping2 %>% 
  dplyr::filter(shopping2$banco == 1 & shopping2$barbearia) %>% 
  nrow()

hairFashion_chaveiro_banco <- shopping2 %>% 
  dplyr::filter(shopping2$hair_fashion == 1 & shopping2$chaveiro & shopping2$banco) %>% 
  nrow()

hairFashion_chaveiro_barbearia <- shopping2 %>% 
  dplyr::filter(shopping2$hair_fashion == 1 & shopping2$chaveiro & shopping2$barbearia) %>% 
  nrow()

hairFashion_banco_barbearia <- shopping2 %>% 
  dplyr::filter(shopping2$hair_fashion == 1 & shopping2$banco & shopping2$barbearia) %>% 
  nrow()

chaveiro_banco_barbearia <- shopping2 %>% 
  dplyr::filter(shopping2$chaveiro == 1 & shopping2$banco & shopping2$barbearia) %>% 
  nrow()

todos <- shopping2 %>% 
  dplyr::filter(shopping2$chaveiro == 1 & shopping2$banco & shopping2$barbearia & shopping2$hair_fashion) %>% 
  nrow()

#Conjuntos
invisible(draw.quad.venn(
  area1 = hairFashion,
  area2 = chaveiro,
  area3 = banco,
  area4 = barbearia,
  n12 = hairFashion_chaveiro,
  n13 = hairFashion_banco,
  n14 = hairFashion_barbearia,
  n23 = chaveiro_banco,
  n24 = chaveiro_barbearia,
  n34 = banco_barbearia,
  n123 = hairFashion_chaveiro_banco,
  n124 = hairFashion_chaveiro_barbearia,
  n134 = hairFashion_banco_barbearia,
  n234 = chaveiro_banco_barbearia,
  n1234 = todos,
  category = c("Salão", "Chaveiro", "Banco", "Barbearia"),
  fill = c("orange", "red", "green", "blue"),
  lty = "dashed",
  cex = 2,
  cat.cex = 2,
  cat.col = c("orange", "red", "green", "blue")
));


#Gráfico empilhado
bp <- barplot(t(shopping[ , -c(1,6)]), col = c("blue", "red", "green", "yellow"))
axis(side = 1, at = bp, labels = shopping$Nome)

# invisible(draw.pairwise.venn(area1 = hairFashion,
#                             #Número de elementos da primeira categoria
#                              area2 = chaveiro,
#                              #Número de elementos da segunda categoria
#                              cross.area = hairFashion_chaveiro,
#                              #Número de elementos na intersecção
#                              category = c("Shoppings com\n salão de beleza",
#                                           "Shoppings com\n chaveiros"),
#                              #Nome das categorias
#                              lty = c("blank", "blank"),
#                              #Grossura das bordas
#                              fill = c("light blue", "pink"),
#                              #Cores das bordas
#                              alpha = c(0.5, 0.5),
#                              #Transparência das bordas
#                              cat.pos = c(0, 0),
#                              #Posição dos títulos com relação aos círculos. 0 quer dizer "em cima"
#                             scaled = F
##                              #Constrói as áreas sem escala
# ))