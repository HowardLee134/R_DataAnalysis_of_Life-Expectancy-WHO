### Project 1

## Homework 2
# a. Partner: Ming-Hao Lee

# b. a link to your dataset
# https://www.kaggle.com/datasets/kumarajarshi/life-expectancy-who?resource=download

# c. What does each observation of the dataset represent?
# Each observation represents the data of a country in a particular year.

# d.What does each variable of the dataset represent?
# Country: 193 countries	
#Year: 2000-2015
#Status: Developed or Developing status
#Life expectancy: Life Expectancy in age	
#Adult Mortality: Adult Mortality Rates of both sexes (probability of dying between 15 and 60 years per 1000 population)
#infant deaths: Number of Infant Deaths per 1000 population
#Alcohol: Alcohol, recorded per capita (15+) consumption (in litres of pure alcohol)
#percentage expenditure: Expenditure on health as a percentage of Gross Domestic Product per capita(%)	
#Hepatitis B: Hepatitis B (HepB) immunization coverage among 1-year-olds (%)
#Measles: Measles - number of reported cases per 1000 population 
#BMI: Average Body Mass Index of entire population
#under-five deaths: Number of under-five deaths per 1000 population
#Polio: Polio (Pol3) immunization coverage among 1-year-olds (%)
#Total expenditure: General government expenditure on health as a percentage of total government expenditure (%)
#Diphtheria: Diphtheria tetanus toxoid and pertussis (DTP3) immunization coverage among 1-year-olds (%)
#HIV/AIDS: Deaths per 1 000 live births HIV/AIDS (0-4 years)
#GDP: Gross Domestic Product per capita (in USD)	
#Population: Population of the country 
#thinness  1-19 years: Prevalence of thinness among children and adolescents for Age 10 to 19 (%)
#thinness 5-9 years: Prevalence of thinness among children for Age 5 to 9(%)
#Income composition of resources: Human Development Index in terms of income composition of resources (index ranging from 0 to 1)
#Schooling: Number of years of Schooling(years)

# e. Why are you interested in performing data analytics on this dataset?
# This dataset is about life expectancy, including data related to life 
# expectancy in different years in different countries. This data set has a 
# large amount of data, including 22 columns and 2938 rows, which meets the 
# requirements of this project. In addition, many factors affect life 
# expectancy, and this dataset lists immune-related, mortality, economic, and 
# social factors. By analyzing these data, we can understand how these factors 
# affect human life expectancy. We can also make recommendations to the 
# government to improve the population's life expectancy based on the data 
# analysis results.



## Homework 3
# 1. read data
getwd()
setwd("/Users/minghaolee/Desktop/UOP_Class/COMP_293/Project")
getwd()
lifeExpectancy<- read.csv("Life Expectancy Data.csv")
View(lifeExpectancy)


# 2. Use the str() function to figure out the number of rows and columns 
str(lifeExpectancy)

# 3. Use the summary() function to summarize your variables
summary(lifeExpectancy)




## Homework 4
library(tidyverse)

# 1. At least one scatterplot showing the relationship between two quantitative 
# variables in your dataset, colored by a categorical variable in the dataset.
lifeExpectancy %>%
  ggplot(aes(BMI, `Life.expectancy`, color = Status)) + geom_point()
  
lifeExpectancy %>%
  ggplot(aes(GDP, `Life.expectancy`,  
             color = Status)) +
  geom_point()

lifeExpectancy %>%
  ggplot(aes(Schooling, `Life.expectancy`,  
             color = Status)) +
  geom_point()



lifeExpectancy %>%
  ggplot(aes(Schooling, Alcohol,  
             color = Status)) +
  geom_point()

# 2. At least one boxplot showing the relationship between a categorical and 
# quantitative variable in your dataset.
lifeExpectancy %>%
  ggplot(aes(Status, Alcohol)) +
  geom_boxplot()
ggsave("Project1-box-1.png")

lifeExpectancy %>%
  ggplot(aes(Status, `Life.expectancy`)) +
  geom_boxplot()
ggsave("Project1-box-2.png")

lifeExpectancy %>%
  select(-Country, -Status, Year == 2015) %>%
  pairs()

## Statistical analysis
### Correlations


#Additional analyses:
######------At least one correlation between two quantitative variables in your dataset, and your interpretation of the result.-------
# We are interesting in the relationship between GDP and Schooling, let see what their correlation.
lifeExpectancy %>%
  select(GDP, Schooling) %>%
  drop_na() %>%
  cor()
#It looks like this two variables have a Moderate positive relationship.  Let's see if that's true with the Spearman correlation as well.


lifeExpectancy %>%
  select(GDP, Schooling) %>%
  drop_na() %>%
  cor(method = "spearman")
#When we perform the Spearman correlation, it looks like the relationship increasing to close to strong positive relationship.



### Hypotheses 
#Some hypotheses I want to test about my data are: 
#1. Whether there's a relationship between `BMI` and `Alcohol` in Japan. 
#1. Whether there's a relationship between `GDP`  and `LifeExpectancy`  in Developed Countries .
#1. Whether there's a difference in mean `Generosity` between "Latin America and Caribbean" and "Middle East and Northern Africa"要改
#1. Whether there's a difference in mean `Family` between "Latin America and Caribbean" and "Middle East and Northern Africa"要改

### Linear regressions
#Let's perform a linear regression to test our first hypothesis.



summary(lm(Alcohol ~BMI, data = lifeExpectancy))

lifeExpectancy %>%
  filter(Alcohol > 1.0) %>%
  filter(Country == "Japan")  %>%
  ggplot(aes(BMI, Alcohol), color = Country) + 
  geom_point() + 
  geom_smooth(method = lm)
#Usage: lm(<dependent variable> ~ <independent variable>, data = <data frame>)

#Let's see what happen when we run a linear model: 
subset <- lifeExpectancy%>%
  filter(Alcohol > 1.0) %>%
  filter(Country == "Japan")

  summary(lm(Alcohol ~BMI, data = subset))
 
#####-------At least one linear regression between two quantitative variables in your dataset,and your interpretation of the result.--------










