# MySQL lab #2 Select

"
Challenge 1
"

"
test 1
"
#CREATE TABLE pub_title
SELECT pub_name, title
FROM publishers
INNER JOIN titles
ON publishers.pub_id = titles.pub_id;

#CREATE TABLE title_author_id
SELECT titles.title_id, title, titleauthor.au_id
FROM titles
INNER JOIN titleauthor
ON titleauthor.title_id = titles.title_id;

#CREATE TABLE author_names
SELECT authors.au_id, au_lname, au_fname
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id;

#CREATE TABLE pub_title_au_id
SELECT pub_name, title_author_id.title, au_id, title_id
FROM pub_title
INNER JOIN title_author_id
ON pub_title.title = title_author_id.title;

#CREATE TABLE publications.author_sales_summary
SELECT author_names.au_id AS Author_ID, au_fname AS First_name, au_lname AS Last_name, title AS Title, pub_name AS Publisher
FROM pub_title_au_id
INNER JOIN author_names
ON pub_title_au_id.au_id = author_names.au_id
GROUP BY Author_ID, First_name, Last_name, Title, Publisher; 

#DROP TABLE IF EXISTS publications.author_sales_summary;

"test 2
"
SELECT titleauthor.au_id, authors.au_lname, authors.au_fname, titles.title_id, titles.title, publishers.pub_name
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON publishers.pub_id = titles.pub_id
GROUP BY titleauthor.au_id, authors.au_lname, authors.au_fname, titles.title_id, titles.title, publishers.pub_name;


"
challenge 2
"
"test 1"
SELECT author_names.au_id AS Author_ID, au_fname AS First_name, au_lname AS Last_name, pub_name AS Publisher, COUNT(title) AS Title_Count
FROM pub_title_au_id
INNER JOIN author_names
ON pub_title_au_id.au_id = author_names.au_id
GROUP BY Author_ID, First_name, Last_name, Publisher;

"test 2"
SELECT titleauthor.au_id, authors.au_lname, authors.au_fname, COUNT(titles.title_id) AS Title_Count, publishers.pub_name
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON publishers.pub_id = titles.pub_id
GROUP BY titleauthor.au_id, authors.au_lname, authors.au_fname,publishers.pub_name;



"
Challenge 3"

"test 1"
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

"test 2"
SELECT titleauthor.au_id, authors.au_lname, authors.au_fname, SUM(sales.qty) AS Total
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN sales
ON sales.title_id = titleauthor.title_id
GROUP BY titleauthor.au_id, authors.au_lname, authors.au_fname
ORDER BY TOTAL DESC
LIMIT 3;



"
Challenge 4
"



"test 2"

SELECT titleauthor.au_id, authors.au_lname, authors.au_fname, COALESCE(SUM(sales.qty),0) AS Total
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN sales
ON sales.title_id = titleauthor.title_id
GROUP BY titleauthor.au_id, authors.au_lname, authors.au_fname
ORDER BY TOTAL DESC;


UPDATE TableY SET Total='0',title_id='0' WHERE Total=NULL;



"
Bonus Challenge - Most Profiting Authors
"
CREATE TABLE Profits
SELECT sales.title_id,au_id,  price * SUM(sales.qty) * royalty/100 *royaltyper/100 + advance AS Profits
FROM titles
INNER JOIN sales
ON sales.title_id = titles.title_id
INNER JOIN titleauthor
ON titles.title_id = titleauthor.title_id
GROUP BY sales.title_id, au_id;

SELECT au_id, SUM(Profits) AS Total
FROM Profits
GROUP BY au_id
ORDER BY Total DESC
LIMIT 3;








