CREATE TABLE Families
(
family_id NUMBER(38,0),
family_name VARCHAR2(50),
num_members NUMBER(38,0),
PRIMARY KEY (family_id)
);
-- Sample insert statement: INSERT INTO Families VALUES(1,'Salem',4);

CREATE TABLE Customers
(
cid NUMBER(38,0),
cname VARCHAR2(40),
dob DATE,
gender VARCHAR2(15),
mstatus VARCHAR2(15),
occupation VARCHAR2(30),
ssn VARCHAR2(11),
is_member VARCHAR2(1), --Y or N
email VARCHAR2(50),
family_id NUMBER(38,0),
PRIMARY KEY (cid),
FOREIGN KEY (family_id) REFERENCES Families(family_id)
);
-- Sample insert statement: INSERT INTO CUSTOMERS VALUES (1,'Mark Salem',TO_DATE('01-12-1985','MM-DD-YYYY'),'Male','Married','123-44-3319','Engineer','Y','mark@gmail.com',1);


CREATE TABLE Addresses
(
cid NUMBER(38,0),
street VARCHAR2(50),
apt VARCHAR2(10),
city VARCHAR2(30),
state VARCHAR2(50),
zip VARCHAR2(20),
PRIMARY KEY(cid,street,apt,city,state,zip),
FOREIGN KEY (cid) REFERENCES Customers(cid)
ON DELETE CASCADE
);


CREATE TABLE Phones
(
cid NUMBER(38,0),
phone VARCHAR2(20),
phone_type VARCHAR2(20), --home, work, cell, etc.
PRIMARY KEY (cid,phone,phone_type),
FOREIGN KEY (cid) REFERENCES Customers(cid)
ON DELETE CASCADE
);
CREATE TABLE Login
(
cid NUMBER(38,0) NOT NULL UNIQUE,
username VARCHAR2(50),
passwd VARCHAR2(50),
PRIMARY KEY (username),
FOREIGN KEY (cid) REFERENCES Customers(cid)
ON DELETE CASCADE
);

CREATE TABLE Point_Accounts
(
point_acct_no VARCHAR2(50),
num_of_points NUMBER(38,0),
family_id NUMBER(38,0),
percent_added NUMBER(38,0),
cid NUMBER(38,0) NOT NULL,
PRIMARY KEY (point_acct_no),
FOREIGN KEY (family_id) REFERENCES Families(family_id),
FOREIGN KEY (cid) REFERENCES Customers(cid)
);

CREATE TABLE Transactions(
tref VARCHAR2(50),
t_date DATE,
t_time VARCHAR2(15),
amount NUMBER(38,2),
t_points NUMBER(38,0), --the points collected from the transaction
cashier_name VARCHAR2(50),
t_description VARCHAR2(400),
cid NUMBER(38,0) NOT NULL,
point_acct_no VARCHAR2(50),
PRIMARY KEY (tref),
FOREIGN KEY (cid) REFERENCES Customers(cid),
FOREIGN KEY (point_acct_no) REFERENCES Point_Accounts(point_acct_no)
);
CREATE TABLE Products
(
prod_id VARCHAR2(50),
prod_name VARCHAR2(50),
price NUMBER(38,2),
prod_points NUMBER(38,0), --number of points assigned to the product
PRIMARY KEY (prod_id)
);

CREATE TABLE Transactions_Products --name of the table representing the M-M relationship between Transactions and Products
(
tref VARCHAR2(50),
prod_id VARCHAR2(50) NOT NULL,
quantity NUMBER(38,0), --quantity of the product in the specific transaction by default it is 1 unless more than 1 item of the same product is bought by the customer
PRIMARY KEY (tref,prod_id),
FOREIGN KEY (tref) REFERENCES Transactions(tref),
FOREIGN KEY (prod_id) REFERENCES Products(prod_id)
);

CREATE TABLE Cards
(
card_id VARCHAR2(50),
exp_date DATE,
status VARCHAR2(1), --V for valid and E for expired
c_date DATE,
cid NUMBER(38,0) NOT NULL,
PRIMARY KEY (card_id),
FOREIGN KEY (cid) REFERENCES Customers(cid)
);

CREATE TABLE Branches
(
branch_id VARCHAR2(50),
branch_name VARCHAR2(50),
opening_hours VARCHAR2(50), -- such as 9 am to 11 pm
b_location VARCHAR2(50),
PRIMARY KEY (branch_id)
);

CREATE TABLE Offers
(
offer_id VARCHAR2(50),
action VARCHAR2(50),
o_date DATE,
o_description VARCHAR2(400),
PRIMARY KEY (offer_id)
);

CREATE TABLE Offers_Branches
(
offer_id VARCHAR2(50),
branch_id VARCHAR2(50) NOT NULL,
PRIMARY KEY (offer_id,branch_id),
FOREIGN KEY (offer_id) REFERENCES Offers(offer_id)
ON DELETE CASCADE,
FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

CREATE TABLE Offers_Transactions
(
tref VARCHAR2(50),
offer_id VARCHAR2(50),
PRIMARY KEY (tref,offer_id),
FOREIGN KEY (tref) REFERENCES Transactions(tref),
FOREIGN KEY (offer_id) REFERENCES Offers(offer_id)
);


CREATE TABLE Prizes
(
prize_id NUMBER(38,0),
points_needed NUMBER(38,0),
p_description VARCHAR2(400),
PRIMARY KEY (prize_id)
);

CREATE TABLE ExchgCenters
(
center_id NUMBER(38,0),
center_name VARCHAR2(50),
c_location VARCHAR2(200),
PRIMARY KEY (center_id)
);
CREATE TABLE Redemption_History --represents the redemption history linking customers to prizes to branches to point accounts
(
cid NUMBER(38,0),
prize_id NUMBER(38,0),
r_date DATE,
quantity NUMBER(38,0), -- by default 1 but this can be 2 or more if the same prize is redeemed more than once on the same date by the same customer in the same exchcenter
point_acct_no VARCHAR2(50),
center_id NUMBER(38,0),
PRIMARY KEY (cid,prize_id,point_acct_no,center_id,r_date),
FOREIGN KEY (cid) REFERENCES Customers(cid),
FOREIGN KEY (prize_id) REFERENCES Prizes(prize_id),
FOREIGN KEY (point_acct_no) REFERENCES Point_Accounts(point_acct_no),
FOREIGN KEY (center_id) REFERENCES ExchgCenters(center_id)
);





