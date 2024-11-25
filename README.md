# Regression-Analysis-of-Concrete-Compressive-Strength

## Overview
This project investigates the relationship between the composition of concrete mixtures and their **compressive strength**. Using a dataset from the **UCI Machine Learning Repository**, the analysis incorporates linear regression and model selection techniques to predict concrete strength based on its ingredients and age.

The project includes:
- **Descriptive and Correlation Analysis**: Insights into the relationships between concrete components.
- **Regression Analysis**: Development of a predictive linear regression model.
- **Model Selection**: Comparison of models using statistical criteria like AIC and adjusted R².

---

## Objectives
1. **Descriptive Analysis**:
   - Explore the dataset using summary statistics and correlation plots.
2. **Regression Modeling**:
   - Build a linear regression model to predict compressive strength.
   - Include polynomial transformations for non-linear relationships.
3. **Model Optimization**:
   - Apply stepwise and best subset selection to identify optimal predictors.
   - Evaluate model assumptions (linearity, normality, homoscedasticity, multicollinearity).

---

## Dataset Description
- **Source**: [UCI Machine Learning Repository - Concrete Compressive Strength Dataset](https://archive.ics.uci.edu/ml/datasets/Concrete+Compressive+Strength).
- **Observations**: 1,030 entries with no missing values.
- **Variables**:
  - Independent Variables:
    - Cement, Fly Ash, Water, Superplasticizer, Blast Furnace Slag, Coarse Aggregate, Fine Aggregate, and Age.
  - Dependent Variable:
    - Compressive Strength (in MPa).

---

## Statistical Methods
The analysis employs the following methods:
1. **Descriptive and Correlation Analysis**:
   - Five-number summaries and correlation matrix.
2. **Linear Regression**:
   - Build and evaluate a model using predictors and polynomial transformations.
3. **Model Selection**:
   - Stepwise regression using AIC.
   - Best subset selection using adjusted R².
4. **Residual Analysis**:
   - Evaluate model assumptions:
     - Linearity, normality, homoscedasticity, and multicollinearity.

---

## Code Functionality

The provided R code performs a **regression analysis** to predict **concrete compressive strength** based on its composition and age. The key functionalities include:

1. **Data Preprocessing**:
   - Loads and cleans the dataset from the UCI Machine Learning Repository.
   - Ensures proper formatting and handling of variables.

2. **Descriptive and Correlation Analysis**:
   - Summarizes the dataset using summary statistics.
   - Generates a correlation matrix and plots to visualize relationships between variables.

3. **Regression Modeling**:
   - Builds a full linear regression model with all predictors.
   - Includes polynomial transformations for non-linear relationships (e.g., Age²).

4. **Model Selection**:
   - Performs stepwise regression using AIC to identify optimal predictors.
   - Applies best subset selection based on adjusted R².

5. **Model Diagnostics**:
   - Evaluates residuals for:
     - Linearity,
     - Homoscedasticity,
     - Normality,
     - Multicollinearity.

## Outputs

### Descriptive Statistics
- Summary statistics for all variables (e.g., mean, median, range).
- Correlation matrix and correlation plot.

### Regression and Model Selection
- Full regression model summary.
- Optimal regression model based on AIC and adjusted R².

### Diagnostic Plots
- Residual plots:
  - Residuals vs. Fitted values (linearity check).
  - Scale-Location plot (homoscedasticity check).
  - Q-Q plot (normality check).
  - Variance Inflation Factor (multicollinearity check).

---

## Key Insights

1. **Descriptive Statistics**:
   - Cement shows the strongest positive correlation with compressive strength (r = 0.4978).
   - Water content negatively affects compressive strength (r = -0.2896).

2. **Regression Analysis**:
   - Polynomial terms for Age reveal a non-linear relationship with compressive strength.
   - Cement, Fly Ash, and Blast Furnace Slag significantly increase compressive strength.
   - Water content reduces compressive strength.

3. **Model Performance**:
   - Full Model: Adjusted R² = 0.7955.
   - AIC-Selected Model: Adjusted R² = 0.7955 with fewer predictors.

4. **Residual Analysis**:
   - Potential issues with heteroscedasticity and normality of residuals.
   - Moderate multicollinearity detected for Cement and Water.

---

## References

1. UCI Machine Learning Repository. [Concrete Compressive Strength Dataset](https://archive.ics.uci.edu/ml/datasets/Concrete+Compressive+Strength).
2. Hadley Wickham et al. *dplyr: A Grammar of Data Manipulation*. [CRAN](https://CRAN.R-project.org/package=dplyr).
3. Hadley Wickham. *ggplot2: Elegant Graphics for Data Analysis*. Springer, 2016. [ggplot2 Documentation](https://ggplot2.tidyverse.org/).
4. Aravind Hebbali. *olsrr: Tools for Building OLS Regression Models*. [CRAN](https://CRAN.R-project.org/package=olsrr).
5. Alboukadel Kassambara. *ggcorrplot: Visualization of a Correlation Matrix using ggplot2*. [CRAN](https://CRAN.R-project.org/package=ggcorrplot).
6. W. N. Venables and B. D. Ripley. *MASS: Modern Applied Statistics with S*. [MASS Documentation](https://www.stats.ox.ac.uk/pub/MASS4/).
