CREATE DATABASE lab_mysql;
USE lab_mysql;
DESCRIBE cars;
CREATE TABLE cars (car_VIN VARCHAR(20), manufacturer VARCHAR(20),
       model VARCHAR(20), year_model INT, color VARCHAR(20), ID INT);
Alter table cars rename column ID to ID_cars;

INSERT INTO cars (ID, car_VIN, manufacturer, model, year_model, color) VALUES 
('0', '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', '2019','Blue'),
('1','ZM8G7BEUQZ97IH46V','Peugeot','Rifter','2019','Red'),
('2','RKXVNNIHLVVZOUB4M','Ford','Fusion','2018','White'),
('3','HKNDGS7CU31E9Z7JW', 'Toyota','RAV4','2018','Silver'),
('4', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', '2019','Gray'),
('5', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', '2019','Gray');

SHOW TABLES;

ALTER TABLE cars DROP COLUMN car_VIN;
ALTER TABLE cars ADD COLUMN car_VIN VARCHAR(20);

DESCRIBE customers;
ALTER TABLE customers DROP COLUMN phone_num;
ALTER TABLE customers ADD COLUMN phone_num VARCHAR(20);
ALTER TABLE customers ADD COLUMN ID BIGINT;
ALTER TABLE customers MODIFY COLUMN address VARCHAR(50);
Alter table customers rename column ID to ID_customerstable;

INSERT INTO customers (ID, customer_id, name_cust, phone_num, email, address, city, state_province, country, zip_postal) VALUES
('0', '10001', 'Pablo Picasso', '+34 636 17 63 82', '-', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045'),
('1', '20001', 'Abraham Lincoln', '+1 305 907 7086', '-', '120 SW 8th St', 'Miami', 'Florida', 'United States', '33130'),
('2', '30001', 'Napoléon Bonaparte', '+33 1 79 75 40 00', '-', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', '75008');



DESCRIBE salespersons;
ALTER TABLE salespersons ADD COLUMN ID BIGINT;
ALTER TABLE salespersons MODIFY COLUMN name_salespers VARCHAR(30);
Alter table salespersons rename column ID to ID_salespersons;

Insert into salespersons (ID, staff_id, name_salespers, store) VALUES
('0', '00001', 'Petey Cruiser', 'Madrid'),
('1', '00002', 'Anna Sthesia', 'Barcelona'),
('2', '00003', 'Paul Molive', 'Berlin'),
('3', '00004', 'Gail Forcewind', 'Paris'), 
('4', '00005', 'Paige Turner', 'Mimia'),
('5', '00006', 'Bob Frapples', 'Mexico City'), 
('6', '00007', 'Walter Melon', 'Amsterdam'),
('7', '00008', 'Shonda Leer', 'São Paulo');

DESCRIBE invoices;
alter table invoices add column ID BIGINT;
alter table invoices modify column car_VIN VARCHAR(30);
alter table invoices modify column date_sale VARCHAR(30);
alter table invoices drop column staff_id;
alter table invoices add column (ID_cars BIGINT(30), ID_customerstable BIGINT(30), ID_salespersons BIGINT(30));
alter table invoices rename column ID to ID_invoices;

insert into invoices (ID_invoices, invoice_number, date_sale, ID_cars, ID_customerstable, ID_salespersons) values
('0','852399038','22-08-2018','0','1','3'),
('1','731166526','31-12-2018','3','0','5'), 
('2','271135104','22-01-2019','2','2','7');



UPDATE salespersons SET store='Miami' WHERE staff_id=5;

UPDATE customers SET email = 'ppicasso@gmail.com'
WHERE name_cust = 'Pablo Picasso';

UPDATE customers SET email = 'lincoln@us.gov'
WHERE name_cust = 'Abraham Lincoln';

UPDATE customers SET email = 'hello@napoleon.me'
WHERE name_cust = 'Napoléon Bonaparte';

DELETE FROM cars WHERE ID_cars = '4';



