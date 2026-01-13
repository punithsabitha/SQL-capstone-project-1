CREATE TABLE IF NOT EXISTS salesman(
salesman_id TEXT PRIMARY KEY,
name TEXT,
city TEXT,
commision TEXT,
);
INSERT INTO salesman(salesman_id,name,city,commision)
VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

CREATE TABLE IF NOT EXISTS customer(
customer_id TEXT,
cust_name TEXT PRIMARY KEY,
city TEXT,
grade TEXT,
salesman_id TEXT,
);


INSERT INTO Customer(customer_id,cust_name,city,grade,Salesman_id)
VALUES
("3002","nick rimando","new york","100","5001"),
("3007","brad davis","new york","200","5001"),
("3005","graham zusi","california","200","5002"),
("3008","julian green","london","300","5002"),
("3004","fabian johnson","paris","300","5006"),
("3009","geoff cameron","berlin","100","5003"),
("3003","jozy altidore","moscow","200","5007"),
("3001","brad guzan","london","","5005");

CREATE TABLE IF NOT EXISTS Orders(
 ord_no TEXT PRIMARY KEY,
 purch_amt TEXT,
 ord_date TEXT,
 customer_id TEXT,
 Salesman_id TEXT
);

INSERT INTO Orders(ord_no,purch_amt,ord_date,customer_id,Salesman_id)
VALUES
("70001","150.5","2012-10-05","3005","5002"),
("70009","270.65","2012-09-10","3001","5001"),
("70004","65.26","2012-10-5","3002","5003"),
("70005","110.5","2012-08-17","3007","5006"),
("70007","948.5","2012-09-10","3005","5005"),
("70005","2400.6","2012-07-27","3007","5006"),
("3009","geoff cameron","berlin","100","5003"),
("3003","jozy altidore","moscow","200","5007"),
("3001","brad guzan","london","","5005");

CREATE TABLE IF NOT EXISTS Orders(
 ord_no TEXT PRIMARY KEY,
 purch_amt TEXT,
 ord_date TEXT,
 customer_id TEXT,
 Salesman_id TEXT
);

INSERT INTO Orders(ord_no,purch_amt,ord_date,customer_id,Salesman_id)
VALUES
("70001","150.5","2012-10-05","3005","5002"),
("70009","270.65","2012-09-10","3001","5001"),
("70002","65.26","2012-10-05","3002","5003"),
("70004","110.5","2012-08-17","3009","5007"),
("70007","948.5","2012-09-10","3005","5005"),
("70005","2400.6","2012-07-27","3007","5006");


-- Queries

-- Matching customers and salesmen by city
SELECT customer.cust_name, salesman.name, salesman.city
FROM Customer
JOIN Salesman ON Customer.city = Salesman.city;

-- Linking customers to their salesmen
SELECT Customer.cust_name, Salesman.name
FROM customer
JOIN salesman ON customer.salesman_id = salesman.salesman_id;

-- Fetching orders where customer city does not match salesmans city
SELECT orders.order_no,Customer.cust_name,orders.customer_id,Orders.salesmans_id
FROM orders
JOIN salesman ON customer.salesman_id = salesman.salesman_id
JOIN salesman ON customer.salesman_id = salesman.salesman_id
WHERE Customer.city <> salesman.city;

-- Fetching all orders with customer names
SELECT Orders.ord_no, Customer.cust_name
FROM orders
JOIN customer ON orders.customer_id = customer.customer_id

-- Customers with grade
SELECT customer.cust_name AS "customer", customer.grade AS "grade"
FROM orders
JOIN salesman ON customer.salesman_id = salesman.salesman_id
JOIN salesman ON customer.salesman_id = salesman.salesman_id
WHERE customer.grade >= 200;

-- orders on a specific date
SELECT *
FROM customer
JOIN customer ON orders.customer_id = customer.customer_id
WHERE orders.ord_date = '2012-10-5';

