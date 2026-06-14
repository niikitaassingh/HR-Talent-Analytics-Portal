1.Total Employees 
SELECT COUNT(*) AS TotalEmployees
FROM hr_analytics_data;

2. Male Employees
SELECT
    Gender,
    COUNT(*) AS EmployeeCount,
    ROUND(COUNT(*) * 100.0 /
          (SELECT COUNT(*) FROM hr_analytics_data),2) AS Percentage
FROM hr_analytics_data
GROUP BY Gender;

3. Female Employees 
SELECT COUNT(*) AS FemaleEmployees
FROM hr_analytics_data
WHERE Gender='Female';

4. Active Employees 
Attrition = 'No'

means Active Employee.

SELECT COUNT(*) AS ActiveEmployees
FROM hr_analytics_data
WHERE Attrition='No';

5. At Risk / Retrenchment
SELECT COUNT(*) AS AtRiskEmployees
FROM hr_analytics_data
WHERE Attrition='Yes';

6.Promotion vs Retrenchment by Department
SELECT
    Department,
    SUM(CASE WHEN [Promotion status]='Due for promotion'
             THEN 1 ELSE 0 END) AS DueForPromotion,

    SUM(CASE WHEN Retirement='Yes'
             OR Attrition='Yes'
             THEN 1 ELSE 0 END) AS DueForRetrenchment
FROM hr_analytics_data
GROUP BY Department
ORDER BY Department;


7. Employee Count by Job Satisfaction
SELECT
    [Job satisfaction],
    COUNT(*) AS Employees
FROM hr_analytics_data
GROUP BY [Job satisfaction]
ORDER BY Employees DESC;


8. Employees by Overtime
SELECT
    OverTime,
    COUNT(*) AS Employees,
    ROUND(COUNT(*) * 100.0 /
          (SELECT COUNT(*) FROM hr_analytics_data),2) AS Percentage
FROM hr_analytics_data
GROUP BY OverTime;

9. High Rating
SELECT
ROUND(
SUM(CASE WHEN PerformanceRating=4 THEN 1 ELSE 0 END)
*100.0 / COUNT(*),2) AS HighRatingPercentage
FROM hr_analytics_data;

11. Job Role Wise Employee Count
SELECT
    JobRole,
    COUNT(*) AS TotalEmployees
FROM hr_analytics_data
GROUP BY JobRole
ORDER BY TotalEmployees DESC;

12. Job Role Wise Promotion Count
SELECT
    JobRole,
    COUNT(*) AS DueForPromotion
FROM hr_analytics_data
WHERE [Promotion status]='Due for promotion'
GROUP BY JobRole
ORDER BY DueForPromotion DESC;

13. Job Role Wise Retrenchment Count
SELECT
    JobRole,
    COUNT(*) AS DueForRetrenchment
FROM hr_analytics_data
WHERE Attrition='Yes'
GROUP BY JobRole
ORDER BY DueForRetrenchment DESC;


14. Total Promotion Count
SELECT COUNT(*) AS DueForPromotion
FROM hr_analytics_data
WHERE [Promotion status]='Due for promotion';

15. Tenure Distribution
SELECT
    YearsAtCompany,
    COUNT(*) AS Employees
FROM hr_analytics_data
GROUP BY YearsAtCompany
ORDER BY Employees DESC;

16. Employee Level Distribution
SELECT
    [Job Level],
    COUNT(*) AS Employees,
    ROUND(
        COUNT(*)*100.0/
        (SELECT COUNT(*) FROM hr_analytics_data),2
    ) AS Percentage
FROM hr_analytics_data
GROUP BY [Job Level]
ORDER BY [Job Level];