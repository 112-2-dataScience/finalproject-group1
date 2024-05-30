# Chi-Square test on Attrition and Department
## Results:
* X-squared = 10.796, df = 2, p-value = 0.004526
* Statistically Significant Association: 
  * Since the p-value (0.0045) is less than 0.05, we reject the null hypothesis. 
  * This means there is a statistically significant association between Attrition and Department.
* Interpretation of Association: 
    The association suggests that the attrition rates vary significantly across different departments.

# ANOVA Test for the Effect of Job Role on Monthly Income
## Results:
| Source     | Df   | Sum Sq      | Mean Sq     | F value | Pr(>F)     |
|------------|------|-------------|-------------|---------|------------|
| JobRole    | 8    | 2.657e+10   | 3.321e+09   | 810.2   | <2e-16 *** |
| Residuals  | 1461 | 5.989e+09   | 4.099e+06   |         |            |

* Significant Effect: The very low p-value (<2e-16) suggests that JobRole has a statistically significant effect on MonthlyIncome.
* Reject the null hypothesis the null hypothesis, which states that the means of MonthlyIncome are the same across different job roles. There is strong evidence that the average MonthlyIncome varies by JobRole.
