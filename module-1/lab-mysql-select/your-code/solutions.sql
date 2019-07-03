# MySQL lab #2 Select

CREATE TABLE pub_title
SELECT pub_name, title
FROM publishers
INNER JOIN titles
ON publishers.pub_id = titles.pub_id;

CREATE TABLE title_author_id
SELECT titles.title_id, title, titleauthor.au_id
FROM titles
INNER JOIN titleauthor
ON titleauthor.title_id = titles.title_id;

CREATE TABLE author_names
SELECT authors.au_id, au_lname, au_fname
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id;

CREATE TABLE pub_title_au_id
SELECT pub_name, title_author_id.title, au_id, title_id
FROM pub_title
INNER JOIN title_author_id
ON pub_title.title = title_author_id.title;

CREATE TABLE publications.author_sales_summary
SELECT author_names.au_id AS Author_ID, au_fname AS First_name, au_lname AS Last_name, title AS Title, pub_name AS Publisher
FROM pub_title_au_id
INNER JOIN author_names
ON pub_title_au_id.au_id = author_names.au_id
GROUP BY Author_ID, First_name, Last_name, Title, Publisher; 

#DROP TABLE IF EXISTS publications.author_sales_summary;


"
Challenge 2
"
SELECT author_names.au_id AS Author_ID, au_fname AS First_name, au_lname AS Last_name, pub_name AS Publisher, COUNT(title) AS Title_Count
FROM pub_title_au_id
INNER JOIN author_names
ON pub_title_au_id.au_id = author_names.au_id
GROUP BY Author_ID, First_name, Last_name, Publisher;

"
Challenge 3"

Create table TableZ
SELECT author_names.au_id AS Author_ID, au_fname AS First_name, au_lname AS Last_name, title AS Title, pub_name AS Publisher, title_id
FROM pub_title_au_id
INNER JOIN author_names
ON pub_title_au_id.au_id = author_names.au_id
GROUP BY Author_ID, First_name, Last_name, Title, Publisher, title_id; 




SELECT Author_ID, First_name, Last_name,SUM(sales.qty) AS Total
FROM TableZ
INNER JOIN sales
ON TableZ.title_id = sales.title_id
GROUP BY Author_ID, First_name, Last_name
ORDER BY Total DESC
LIMIT 3;



"
Challenge 4
"

CREATE TABLE TableY 
SELECT Author_ID, First_name, sales.title_id, Last_name,SUM(sales.qty) AS Total
FROM TableZ
INNER JOIN sales
ON TableZ.title_id = sales.title_id
GROUP BY Author_ID, First_name, Last_name, title_id
ORDER BY Total DESC;

UPDATE TableY SET Total='0',title_id='0' WHERE Total=NULL;

SELECT *
FROM TableY
Order by Total DESC;


"
Bonus Challenge - Most Profiting Authors
"
CREATE TABLE TableW
SELECT Author_ID, First_name, Last_name, titles.title_id, ytd_sales, advance, royalty, price, ytd_sales*price AS TotalSales, ytd_sales*price*royalty/100 AS TotalRoyalty
FROM TableY
INNER JOIN titles
ON TableY.title_id = titles.title_id
GROUP BY Author_ID, First_name, Last_name, titles.title_id, ytd_sales, advance, royalty, price, Totalsales, TotalRoyalty;

Create table Profits
Select Author_ID, First_name, Last_name, advance, royalty, price, Totalsales, TotalRoyalty, royaltyper, TotalRoyalty*royaltyper/100 AS PerceivedRoyalty, advance + TotalRoyalty*royaltyper/100 AS Profit
From TableW
Inner Join titleauthor
ON TableW.title_id = titleauthor.title_id AND TableW.AUTHOR_ID = titleauthor.au_id
GROUP BY Author_ID, First_name, Last_name, advance, royalty, price, Totalsales, TotalRoyalty, royaltyper, PerceivedRoyalty, Profit;

SELECT *
FROM Profits
Order by Profit DESC
Limit 3;











