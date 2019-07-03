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
SELECT pub_name, title_author_id.title, au_id
FROM pub_title
INNER JOIN title_author_id
ON pub_title.title = title_author_id.title;

CREATE TABLE publications.author_sales_summary
SELECT author_names.au_id AS Author_ID, au_fname AS First_name, au_lname AS Last_name, title AS Title, pub_name AS Publisher
FROM pub_title_au_id
INNER JOIN author_names
ON pub_title_au_id.au_id = author_names.au_id
GROUP BY Author_ID, First_name, Last_name, Title, Publisher; 

DROP TABLE IF EXISTS publications.author_sales_summary;