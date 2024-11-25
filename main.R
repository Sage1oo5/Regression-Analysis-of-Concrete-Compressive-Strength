library(dplyr)
library(readxl)
library(olsrr)
library(corrplot)
library(ggplot2)
library(ggcorrplot)
library(MASS)
data <- read_excel('/Users/sage/Desktop/Concrete_Data.xls')
colnames(data) <- gsub("`", "", colnames(data))
data_frame=data.frame(data)
# Assuming 'data' is your data frame
colnames(data_frame) <- c("Cement", "Blast_Furnace_Slag", "Fly_Ash", "Water", 
                          "Superplasticizer", "Coarse_Aggregate", "Fine_Aggregate", 
                          "Age", "Concrete_Compressive_Strength")




na_counts <- sapply(data_frame, function(x) sum(is.na(x)))


# Print the number of NA values in each column
print(na_counts)
#Question 1
summary(data_frame)


# Calculate correlation matrix


model.matrix(~0+., data=data_frame) %>% 
  cor(use="pairwise.complete.obs") %>% 
  ggcorrplot(show.diag=FALSE, type="lower", lab=TRUE, lab_size=2)

cor_matrix <- model.matrix(~0+., data=data_frame) %>%
  cor(use="pairwise.complete.obs")

# Print the correlation matrix in tabular format using knitr::kable
knitr::kable(cor_matrix)



#Question 2
# Fit a linear model with both linear and polynomial terms for Age..day.
model <- lm(Concrete_Compressive_Strength~ Blast_Furnace_Slag+Fly_Ash+Water+
              Superplasticizer+Coarse_Aggregate+Fine_Aggregate+
              Cement+ poly(Age,3),
            data = data_frame)




# Print the model summary
summary(model)
plot(data_frame)
par(mfrow = c(2, 2))  # Set the layout for multiple plots
# Residuals vs. Fitted Values Plot
plot(model, which = 1)



# Normal Q-Q Plot
plot(model, which = 2)

# Scale-Location Plot
plot(model, which = 3)

# Residuals vs. Leverage Plot
plot(model, which = 5)


# Loop through column names
for (col in colnames(data_frame)) {
  if (col != "Concrete_Compressive_Strength"    ) {
    
    # Fix variable names starting with numeric values
    col_fixed <- make.names(col)
    
    p <- ggplot(data_frame, aes_string(x = col_fixed, y = "Concrete_Compressive_Strength")) +
      geom_point() +
      geom_smooth(method = 'lm', se = FALSE, color = "blue") +
      labs(x = col_fixed, y = "Concrete_Compressive_Strength" , title = "Regression Line") +
      theme_minimal()
    
    # Print the plot
    print(p)
  }
}

ggplot(data_frame, aes(x = Age, y = Concrete_Compressive_Strength)) +
  geom_point() +
  geom_smooth(method = 'lm', formula = y ~ poly(x, 3), se = FALSE, color = "blue") + # Use a polynomial formula
  labs(x = "Age", y = "Concrete Compressive Strength", title = "Polynomial Regression Line to the degree 3") +
  theme_minimal()



#Question 3

stepAIC(model, direction = c("both"))
olsbest <- ols_step_all_possible(model)
# Now, extract only the rsquare and aic columns
sorted_sqr <- olsbest %>% 
  arrange(desc(`rsquare`))


# Display the top model with the highest Adjusted R-squared
head(sorted_sqr, 1)



#Question4

selected_Model_aic <- lm(formula = Concrete_Compressive_Strength ~ Blast_Furnace_Slag + 
                           Fly_Ash + Water + Superplasticizer + Coarse_Aggregate + Cement + 
                           poly(Age, 3), data = data_frame)

summary(selected_Model_aic)
# Set smaller margins
par(mar = c(4, 4, 2, 2))  

plot(selected_Model_aic, which = 1)



# Normal Q-Q Plot
plot(selected_Model_aic, which = 2)

# Scale-Location Plot
plot(selected_Model_aic, which = 3)

# Residuals vs. Leverage Plot
plot(selected_Model_aic, which = 5)

# Reset the margins to the default values if needed
# par(mar = c(5, 4, 4, 2) + 0.1)


# 2. Obtain the residuals
residuals <- resid(selected_Model_aic)

res<- data_frame$Concrete_Compressive_Strength - selected_Model_aic$fitted.values
plot(selected_Model_aic$fitted.values, res, xlab = ("Fitted model"),
     ylab = ("Residuals"), cex = 0.7, main = "",  cex.lab = 1.25)
abline(0,0,col="blue")
qqnorm(res,main="", xlab="Theoretical Quantiles", ylab= "Residuals", cex=0.77, cex.lab = 1.25)
qqline(res, col="blue")
#confidence intervals

car::vif(selected_Model_aic)
conf <- confint(selected_Model_aic, data = df, level = 0.95)
selected_Model_aic$xlevels
round(conf,3)

