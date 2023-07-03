install.packages("dplyr")
library(dplyr)
install.packages("readxl")
library(readxl)
install.packages("ggplot2")
library(ggplot2)

NYC_data_set <- read_excel("C:/Users/Saite/Downloads/Copy of G&T Results 2017-18 (Responses) - Form Responses 1 (1).xlsx")

head(NYC_data_set)
summary(NYC_data_set)
str(NYC_data_set)

#Rename the coloumns
NYC_data_set_rename <- NYC_data_set %>%  rename(Enrollment = `Will you enroll there?` , Grades = `Entering Grade Level`,
                                                Birth_Month = `Birth Month` , OLSAT_Verbal_Score =`OLSAT Verbal Score` ,
                                                OLSAT_Verbal_Percentile = `OLSAT Verbal Percentile` , NNAT_Non_Verbal_Raw_Score = `NNAT Non Verbal Raw Score`,
                                                NNAT_Non_Verbal_Percentile =`NNAT Non Verbal Percentile`, Overall_Score = `Overall Score` ,School_Preferences = `School Preferences`,
                                                School_Assigned= `School Assigned`)

#Convert coloum to numeric type
NYC_data_set_rename$OLSAT_Verbal_Score <- as.numeric(NYC_data_set_rename$OLSAT_Verbal_Score)

NYC_data_set_rename$District <- as.numeric(NYC_data_set_rename$District)

NYC_data_set_rename$School_Preferences <- as.numeric(NYC_data_set_rename$School_Preferences)

NYC_data_set_rename$School_Assigned <- as.numeric(NYC_data_set_rename$School_Assigned)

NYC_data_set_rename$Enrollment <- as.numeric(NYC_data_set_rename$Enrollment)

#Remove duplicates
NYC_data_set <- unique(NYC_data_set_rename)

#Replacing missing value with mean
NYC_data_set <- NYC_data_set %>% mutate_if(is.numeric , ~ifelse(is.na(.), mean(., na.rm = TRUE), .))

#Replacing Na value with 0
NYC_data_set_Replace <- replace(NYC_data_set, is.na(NYC_data_set), 0)

#handeling the missing values
NYC_data_set1 <- NYC_data_set_Replace %>% na.omit(NYC_data_set_Replace)
summary(NYC_data_set1)

#Removing outliers
NYC_data_set_outliers <- NYC_data_set1[NYC_data_set1$Overall_Score < 97.00, ]

#Box plot
NYC_data_set_plot <- ggplot(NYC_data_set_outliers, aes(x = Grades, y = Overall_Score)) +
  geom_boxplot(color = "skyblue") +
  ggtitle("Outliers in Numeric Column")

#Histogram
histogram_plot <- ggplot(NYC_data_set_outliers, aes(x = OLSAT_Verbal_Score )) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  labs(title = "Distribution of score",
       x = "Verbal score",
       y = "count")


write.csv(NYC_data_set_outliers, "cleaned_G&T_Results_dataset.csv", row.names = FALSE)


