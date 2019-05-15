library(tidyverse)
library(vegan)

data(BCI, package = "vegan")

BCI %>%
  colSums() %>% 
  sort(decreasing = TRUE) %>% 
  plot()


iris <- as_tibble(iris)
iris

#Select
iris %>% select(Sepal.Length, Species)

iris %>% select(-Sepal.Width) #removing

iris %>% select(Sepal.Length:Petal.Length) #selecting all coloumns from one to another

iris %>% select(Sepal.Length:Petal.Length, Species) #selecting all coloumns from one to another + something

iris %>% rename(sepal.length = Sepal.Length) #new name = old name, can put multiple ones in here

#Filter
iris %>%  filter(Sepal.Length > 5, Petal.Length < 2) # get some of the individuals who fulfill the requirement


#Mutate
iris %>% mutate(Petal.Area = Petal.Length * Petal.Width) #add a new petal area coloumn
iris %>% mutate(Species = toupper(Species)) #makes all species names' upper case

#Calculate mean petal length and standard deviation of each species
iris %>% group_by(Species) %>% 
  summarise(mean_petal_length = mean(Petal.Length), sd_petal_length = sd(Petal.Length))

iris %>% group_by(Species) %>% 
  mutate(mean_petal_length = mean(Petal.Length))


#Arrange
iris %>% arrange(Petal.Length)

iris %>% arrange(desc(Petal.Length)) 

iris %>% group_by(Species) %>% arrange(Petal.Length) %>% slice(1) #the smallest petal length from each species






