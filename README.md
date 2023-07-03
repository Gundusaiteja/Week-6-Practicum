#week6 practicum

#Package Installation:
   - `dplyr`: Used for data manipulation
   - `readxl`: Used for reading Excel files
   - `ggplot2`: Used for data visualization

#Reading the Data:
   - The code reads an Excel file named "Copy of G&T Results 2017-18 (Responses) - Form Responses 1 (1).xlsx" located in the "Downloads" directory.
   - The data set is stored in the `NYC_data_set` variable.

#Data Cleaning and Column Renaming:
   - The code renames selected columns using the `rename()` function from the `dplyr` package. The new column names are assigned to the `NYC_data_set_rename` variable.

#Converting Column Types:
   - Several columns are converted to numeric type using the `as.numeric()` function.

#Removing Duplicates:
   - The code removes duplicate rows from the `NYC_data_set_rename` data set using the `unique()` function. The resulting data set is stored in the `NYC_data_set` variable.

#Handling Missing Values:
   - Missing values in numeric columns are replaced with the column mean using the `mutate_if()` function.
   - Remaining missing values are replaced with 0 using the `replace()` function.

#Removing Outliers:
   - Rows with an `Overall_Score` value less than 97.00 are removed, and the resulting data set is stored in the `NYC_data_set_outliers` variable.

#Creating Visualizations:
   - The code generates a box plot (`NYC_data_set_plot`) to visualize the relationship between `Grades` and `Overall_Score` in the `NYC_data_set_outliers` data set.
   - The code also generates a histogram (`histogram_plot`) to display the distribution of `OLSAT_Verbal_Score` in the `NYC_data_set_outliers` data set.

#Saving Cleaned Data:
   - The cleaned data set (`NYC_data_set_outliers`) is saved as a CSV file named "cleaned_dataset.csv" without row names.
