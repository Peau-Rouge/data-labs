"
# Challenge 1 - Most Profiting Authors
"

"
step 1: Calculate the royalties of each sales for each author
"

SELECT ord_num AS SaleNumber, sales.title_id, title, au_id,  price * SUM(sales.qty) * royalty/100 *royaltyper/100 AS Sales_Royalty
FROM titles
INNER JOIN sales
ON sales.title_id = titles.title_id
INNER JOIN titleauthor
ON titles.title_id = titleauthor.title_id
GROUP BY SaleNumber, sales.title_id, title, au_id;

"
step 2: Aggregate the total royalties for each title for each author
"

Create table RoyaltySale
SELECT ord_num AS SaleNumber, sales.title_id, title, au_id,  price * SUM(sales.qty) * royalty/100 *royaltyper/100 AS Sales_Royalty
FROM titles
INNER JOIN sales
ON sales.title_id = titles.title_id
INNER JOIN titleauthor
ON titles.title_id = titleauthor.title_id
GROUP BY SaleNumber, sales.title_id, title, au_id;


SELECT au_id, title_id,  SUM(Sales_Royalty) AS TotalRoyalty
From RoyaltySale
GROUP BY au_id, title_id;

"
step 3: Calculate the total profits of each author
"

Create Table Temp1
SELECT au_id, title_id,  SUM(Sales_Royalty) AS TotalRoyalty
From RoyaltySale
GROUP BY au_id, title_id;

SELECT Temp1.au_id, TotalRoyalty + titles.advance  AS Profit
From Temp1
INNER JOIN titles
ON Temp1.title_id = titles.title_id
GROUP BY Temp1.au_id;


SELECT au_id, SUM(Profits) AS Total
From temp3
GROUP BY au_id
ORDER BY Total DESC
LIMIT 3;


"
# Challenge 2 - Alternative Solution
"

SELECT au_id, SUM(Profits) AS Total
FROM (
	SELECT sales.title_id,au_id,  price * SUM(sales.qty) * royalty/100 *royaltyper/100 + advance AS Profits
	FROM titles
	INNER JOIN sales ON sales.title_id = titles.title_id
	INNER JOIN titleauthor ON titles.title_id = titleauthor.title_id
	GROUP BY sales.title_id, au_id
) summary
GROUP BY au_id
ORDER BY Total DESC
LIMIT 3;



"
# Challenge 3
"
CREATE TABLE most_profiting_authors
SELECT au_id, Profit
FROM Profits
ORDER BY Profits Desc;












