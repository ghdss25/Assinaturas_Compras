setwd("/home/gustavo/Projeto de Dados/Análise_R/assinaturas")
getwd()

devtools::install_github("hrbrmstr/hrbrthemes")
install.packages("fmsb")

library(stringr)
library(tidyverse)
library(ggplot2)
library(dplyr)
library(esquisse)
library(hrbrthemes)

assinaturas <- read.csv("assinaturas.csv", sep = ";")

View(assinaturas)

## Total de Assinaturas Gastas

total_assinaturas_gasto <- sum(assinaturas$Total_Gasto)

total_assinaturas_gasto <- paste("R$", format(total_assinaturas_gasto, decimal.mark = ",", big.mark = ".", nsmall = 2))

view(total_assinaturas_gasto)

esquisser(total_assinaturas_gasto)

library(ggplot2)

ggplot(assinaturas) +
 aes(x = Total_Gasto) +
 geom_density(adjust = 1.1, fill = "#B22222") +
 labs(title = "Total Gasto de Assinaturas", 
 subtitle = "Assinaturas de Usuario") +
 theme_minimal()

## Total de Assinaturas por Nome 

data = data.frame(
  
  Total <- assinaturas$Total_Gasto, 
  Nome <- assinaturas$Nome
)

ggplot(data, aes(x=Nome, y=Total)) + 
  labs(title = "Total Gasto por Nome de Assinantes") +
  geom_bar(stat = "identity") + 
  coord_flip()

## Assinaturas de Gastos por Data de Nascimento

assinaturas$Assinatura <- as.Date(assinaturas$Assinatura)

## Gráfico 

assinaturas %>%
  tail(10) %>% 
  ggplot(aes(x=Assinatura, y=Total_Gasto)) +
  geom_line(color="grey") + 
  geom_point(shape=21, color="black", fill="#69b3a2", size=6) +
  theme_ipsum() +
  ggtitle("Assinaturas de Gastos por Data de Nascimento")

## Total de Gasto das Assinaturas por Sexo e Ocupação

esquisser(assinaturas)

library(ggplot2)

ggplot(assinaturas) +
 aes(x = Sexo, weight = Total_Gasto) +
 geom_bar(fill = "#ED0202") +
 labs(title = "Total de Gasto das Assinaturas por Sexo e Ocupação", 
 subtitle = "Assinatura das Pessoas por Ocupação") +
 theme_minimal() +
 facet_wrap(vars(Ocupação))



