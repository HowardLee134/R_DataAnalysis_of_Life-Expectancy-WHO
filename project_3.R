#project 
#1. Use the read_csv() function to read in the data you chose last week. If you have
    #decided to switch to a different dataset, include your answers to the “project” section
    #from HW2 here as well.

# After we review and discuss about our data, we decieded to change the data sheet 
# Here is the new datasheet link: 
# https://www.kaggle.com/datasets/aungpyaeap/supermarket-sales


getwd()
setwd("/Users/minghaolee/Desktop/UOP_Class/COMP_293/Project")
supermarketSales <- read_csv("supermarket_sales.csv")
#2. Use the str() function to figure out the number of rows and columns in your dataset.

str(supermarketSales)
#1000 obs. of 17 variables which means 1000 rows and 17 columns

#3. Use the summary() function to summarize your variables.
summary(supermarketSales)
#4. Submit your code and the output from your console.


#1. At least one scatterplot showing the relationship between two quantitative variables in
#your dataset, colored by a categorical variable in the dataset.

supermarketSales %>%
  ggplot(aes(Time, Total, color = `Customer type` )) + geom_point()


#2. At least one boxplot showing the relationship between a categorical and quantitative
#variable in your dataset.

supermarketSales %>%
  ggplot(aes(City, `Tax 5%`)) + geom_boxplot()
