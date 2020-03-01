# Pewett Hackard Retirement Analysis (Challenge 7)
For the new modifications to the PlanMyTrip app, you are asked to add more data to the database, or cities DataFrame, so that customers know the weather in the cities when they click on a pop-up marker. You’ll also need to add the amount of rainfall or snowfall within the last three hours so that customers can filter the DataFrame using input statements based on the temperature range and whether or not it is raining or snowing. Finally, you’ll need to create a directions layer Google map that shows the directions between multiple cities for travel.

## Resources
- CSV: titles.csv, salaries.csv, employees.csv, dept_manager.csv, dept_emp.csv, departments.csv
- Software: PostgreSQL 11.7, pgAdmin 4, QuickDBD

## ERD
## Entity Relationship Diagram

Using QUickDBD, I desgined a flowchart to show how the current flat employee data provided by the client can be integrated into a Database. The given CSV files had one main key field that was shared across most of the documents. Emp_no (Employee number) is a unique identifier that will be unique to each employee. In adition, Dept_no (Department number) is a unique identifier that corresponds to the departments within the company. Using these two keys, we are able to design a relational database with the following ERD

![PH ERD](Data/employeeDB.png)



## Part 1
## Who could be retiring soon (based on age of employee)

Based on employees born btween 1952, and 1955 who are currently employeed: There are 33,118 employees who are nearing retirement. The majority of those who could be retiring will be coming from the Senior Engineer position; The breakdown of titles is below:

| Title | Count | % of Retirement Group |
|---|---|---|
| Senior Engineer | 13,651 | 41.22% |
| Senior Staff | 12,872 | 38.87% |
| Engineer | 2,711 | 8.19% |
| Staff	| 2,022 | 6.11% |
| Technique Leader	| 1,609 | 4.86% |
| Assistant Engineer| 	251 | 0.76% |
| Manager| 	2 | 0.01% |
