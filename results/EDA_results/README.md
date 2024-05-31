# Statistic Testing
## Chi-Square test on Attrition and Department
### Results:
* X-squared = 10.796, df = 2, p-value = 0.004526
* Statistically Significant Association: 
  * Since the p-value (0.0045) is less than 0.05, we reject the null hypothesis. 
  * This means there is a statistically significant association between Attrition and Department.
* Interpretation of Association: 
    The association suggests that the attrition rates vary significantly across different departments.

## ANOVA Test for the Effect of Job Role on Monthly Income
### Results:
| Source     | Df   | Sum Sq      | Mean Sq     | F value | Pr(>F)     |
|------------|------|-------------|-------------|---------|------------|
| JobRole    | 8    | 2.657e+10   | 3.321e+09   | 810.2   | <2e-16 *** |
| Residuals  | 1461 | 5.989e+09   | 4.099e+06   |         |            |

* Significant Effect: The very low p-value (<2e-16) suggests that JobRole has a statistically significant effect on MonthlyIncome.
* Reject the null hypothesis the null hypothesis, which states that the means of MonthlyIncome are the same across different job roles. There is strong evidence that the average MonthlyIncome varies by JobRole.

# Distribution
This set of charts provides an overview of attrition distribution and its relationship with monthly income, age, and years at the company:

* Distribution of Attrition: Most employees did not leave the company, with a significantly higher count of 'No' compared to 'Yes'.
* Attrition vs. Monthly Income: Employees who left ('Yes') generally had lower monthly incomes.
* Attrition vs. Age: Younger employees (around age 30) showed higher attrition rates.
* Attrition vs. Years at Company: Employees with fewer years at the company showed higher attrition rates, indicating newer employees are more likely to leave.
![dist](distribution.png)

# Correlation
# Barchart
This bar chart shows the average monthly income of employees in different departments, categorized by their attrition status (Yes or No). Key observations:

* Employees who stayed (No) generally have higher average monthly incomes than those who left (Yes) across all departments.
* The Human Resources department shows a significant income disparity between employees who stayed and those who left.
![cor_1](cor_barchart.png)

## Boxplot
This set of boxplots shows job satisfaction levels categorized by job role and attrition status:

* Job satisfaction levels vary across different job roles.
* In some roles, such as Human Resources and Laboratory Technician, employees who left (Yes) generally had lower job satisfaction compared to those who stayed (No).
![cor_2](cor_boxplot.png)

## Heatmap
This heatmap visualizes the correlation between different indices:

* Attrition has a negative correlation with Monthly Income, Age, and Years at Company, suggesting that higher income, older age, and longer tenure are associated with lower attrition rates.
* Monthly Income is positively correlated with Age and Years at Company, indicating that more experienced and older employees tend to earn more.
![cor_3](cor_heatmap.png)


