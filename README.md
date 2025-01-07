# [The Christmas party drinking list 🍸](https://adventofsql.com/challenges/10)

## Description
Santa has noticed a drop in workshop productivity, with elves exhibiting concerning behaviors, such as sleeping in wrapping paper bins and overly festive singing during work hours. He's concerned that holiday beverage consumption, particularly alcoholic options like Baileys and Mulled Wine, might be contributing to the issue. Recent incidents, such as poorly painted toy trains, have amplified his worries.

Santa has tasked the Data Elf Analytics team with creating a detailed report on beverage consumption trends in the workshop. He asks Mrs. Claus for help analyzing the data to identify the most consumed drinks and prepare for a "Responsible Revelry" workshop to balance holiday cheer and efficiency. He requests discretion, especially concerning Tinker's fondness for Eggnog "quality control."

## Challenge
[Download Challenge data](https://github.com/thatlaconic/advent-of-sql-day-10/blob/main/advent_of_sql_day_10.sql)

You are working with a table named drinks, which logs various types of beverages consumed over the Christmas parties, along with the date and quantity consumed. Your task is to determine which drinks were the most popular by calculating the total quantity consumed for each type of drink.

Submit the date where the following total quantity of drinks were consumed:
+ HotCocoa: 38
+ PeppermintSchnapps: 298
+ Eggnog: 198

## Dataset
This dataset contains 1 tables with 4 columns and 100000 rows. 
### Using PostgreSQL
**input**
```sql
SELECT *
FROM drinks ;
```
**output**

![](https://github.com/thatlaconic/advent-of-sql-day-10/blob/main/drinks.PNG)

### Solution
[Download Solution Code](https://github.com/thatlaconic/advent-of-sql-day-10/blob/main/advent_answer_day10.sql)

**input**
```sql

SELECT *
FROM
(SELECT date,
		SUM(CASE WHEN drink_name = 'Mulled wine' THEN quantity ELSE 0 END) AS mulled_wine,
		SUM(CASE WHEN drink_name ='Hot Cocoa' THEN quantity ELSE 0 END) AS hot_cocoa,
		SUM(CASE WHEN drink_name ='Eggnog' THEN quantity ELSE 0 END) AS eggnog,
		SUM(CASE WHEN drink_name ='Peppermint Schnapps' THEN quantity ELSE 0 END) AS peppermint_schnapps,
		SUM(CASE WHEN drink_name ='Baileys' THEN quantity ELSE 0 END)AS baileys,
		SUM(CASE WHEN drink_name ='Sherry' THEN quantity ELSE 0 END) AS sherry
	FROM drinks
	GROUP BY date
	ORDER BY date
)
WHERE hot_cocoa = 38 AND peppermint_schnapps = 298 AND eggnog = 198
;


```
**output**

![](https://github.com/thatlaconic/advent-of-sql-day-10/blob/main/d10.PNG)



