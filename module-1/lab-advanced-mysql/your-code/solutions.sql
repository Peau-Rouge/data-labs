"
# Challenge 1 - Most Profiting Authors
"

CREATE TABLE temp
SELECT ord_num AS SaleNumber, sales.title_id, title, SUM(qty) AS SalesQty, price, advance, royalty
FROM sales
INNER JOIN titles
ON sales.title_id = titles.title_id
GROUP BY SaleNumber, sales.title_id, title, price, advance, royalty;

Create table temp1
SELECT titleauthor.title_id, au_id, royaltyper
FROM sales
INNER JOIN titleauthor
ON sales.title_id = titleauthor.title_id;

"
step 1
"
SELECT au_id, temp.title_id, title, SalesQty, price, advance, royalty, royaltyper, price * SalesQty * royalty/100 *royaltyper/100 AS Sales_Royalty
From temp
inner join temp1
ON temp.title_id = temp1.title_id
GROUP BY au_id, temp.title_id, title, SalesQty, price, advance, royalty, royaltyper, Sales_Royalty;


"
step 2
"
SELECT au_id, title_id, title, price, advance, royalty, royaltyper, SUM(Sales_Royalty) AS TotalRoyalty
From RoyaltySale
GROUP BY au_id, title_id, title,price, advance, royalty, royaltyper;

"
step 3
"

Create table RoyaltySale
SELECT au_id, temp.title_id, title, SalesQty, price, advance, royalty, royaltyper, price * SalesQty * royalty/100 *royaltyper/100 AS Sales_Royalty
From temp
inner join temp1
ON temp.title_id = temp1.title_id
GROUP BY au_id, temp.title_id, title, SalesQty, price, advance, royalty, royaltyper, Sales_Royalty;


SELECT au_id, title_id, title, price, advance, royalty, royaltyper, SUM(Sales_Royalty) AS TotalRoyalty, SUM(Sales_Royalty)+advance AS Profits
From RoyaltySale
GROUP BY au_id, title_id, title,price, advance, royalty, royaltyper
ORDER BY Profits Desc
LIMIT 3;


"
# Challenge 2 - Alternative Solution
"


SELECT au_id, temp.title_id, title, SalesQty, price, advance, royalty, royaltyper, price * SalesQty * royalty/100 *royaltyper/100 AS Sales_Royalty
From
(SELECT ord_num AS SaleNumber, sales.title_id, title, SUM(qty) AS SalesQty, price, advance, royalty FROM sales INNER JOIN titles ON sales.title_id = titles.title_id)
INNER JOIN
(SELECT titleauthor.title_id, au_id, royaltyper FROM sales INNER JOIN titleauthor ON sales.title_id = titleauthor.title_id);

CREATE TABLE temp
SELECT ord_num AS SaleNumber, sales.title_id, title, SUM(qty) AS SalesQty, price, advance, royalty
FROM sales
INNER JOIN titles
ON sales.title_id = titles.title_id
GROUP BY SaleNumber, sales.title_id, title, price, advance, royalty;

Create table temp1
SELECT titleauthor.title_id, au_id, royaltyper
FROM sales
INNER JOIN titleauthor
ON sales.title_id = titleauthor.title_id;

"
step 1
"
SELECT au_id, temp.title_id, title, SalesQty, price, advance, royalty, royaltyper, price * SalesQty * royalty/100 *royaltyper/100 AS Sales_Royalty
From temp
inner join temp1
ON temp.title_id = temp1.title_id
GROUP BY au_id, temp.title_id, title, SalesQty, price, advance, royalty, royaltyper, Sales_Royalty;



"
# Challenge 3
"
CREATE TABLE most_profiting_authors
SELECT Author_ID, Profit
FROM Profits
ORDER BY Profit Desc;












