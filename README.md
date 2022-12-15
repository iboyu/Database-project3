# Database-project3
Project Component 3 Description:  
The Project Component 3 consists of 3 parts:  
Part 1 (25%):  
1. Execute the LoyaltyFirst_Impl.sql script (posted on Blackboard) to generate the
LoyaltyFirst database tables.  
2. Use the SQL INSERT INTO statement to Insert sample records into the LoyaltyFirst
generated database according to the following guidelines:  
- Insert 20 family records into the Families table. (2%)  
- Insert 50 customer records into the Customers table. Assume that all the customers
added are part of the LoyaltyFirst program. (3%)  
- Insert the customers addresses and phone numbers into the Addresses and Phones
tables respectively. At least 5 customers must have 2 addresses and 2 phone numbers.
(2%)  
- Insert the login information for your customers. You should insert 50 rows
corresponding to the number of customers you have in the Customers table (1-to-1
relationship) (1.5%)  
- Populate the Point_Accounts table. It should contain 50 records corresponding to the
number of customers you have in the Customers table (Each customer should have an
entry in the Point_Accounts table since all the customers are assumed to be part of the
LoyaltyFirst program). (2%)  
- Insert data into the Transactions, Products, and Transactions_Products tables. You
should have a minimum of 10 products and 10 transactions (at least 5 different
products per transaction). Let some transactions contain some common products with
other transactions). (3%)  
- Insert the card information into the Cards table. Each customer must have a valid card.
Let at least 5 customers have a second expired (non-valid) card. (1.5%)  
- Insert the information of at least 10 offers into the Offers table. (1.5%)    
- Insert the information of 6 branches into the Branches table. (1.5%)  
- Create an association of your choice between the offers and branches by populating
the Offers_Branches table. (1.5%)  
- For simplicity, leave the Offers_Transactions table empty.  
- Create a set of 5 exchange centers. (1.5%)  
- Create a list of 15 prizes. (1.5%)  
- Populate the Redemption_History table with sample data linking the Customers,
Prizes, Point_Accounts, and Exchg_Centers tables. You should have a minimum of 20
records in the Redemption_History table. (2.5%)  
Store the SQL INSERT INTO statements in a file named: insertions.sql. Make sure that your
insertions.sql script executes successfully on the LoyaltyFirst database on the GMU Oracle Server.  

**Part 2 (50%):**  
Provide the SQL SELECT statements satisfying the following queries. Include your queries in a
file named queries.sql. Make sure that your queries.sql script executes successfully on the
LoyaltyFirst database on the GMU Oracle Server. Number your queries using SQL Comments
to make it easier on your GTA to grade your project. Not following this guideline would
result in a deduction of 10%.  
1) Select the offer id, action, and date provided by a particular branch name. (2.5%)  
2) Display all the transaction references, transaction amounts, the number of points collected from
each transaction, and the transaction date for a particular customer name. (2.5%)  
3) Find the branch IDs and the number of offers provided by each branch id. (2.5%)  
4) Find the branch names and the number of offers provided by each branch name. (2.5%)  
5) Display for a particular transaction reference, the transaction reference, date, time, amount,
the number of points collected, and the product ids and names included in the transaction with
their quantities, prices, and number of points. (2.5%)  
6) Find the number of expired cards available in the database. (2.5%)  
7) Find the customer with the maximum number of expired cards. (2.5%)  
8) Find the redemption history of a particular customer name. You should display the prize ID,
prize description, customer name,center id, and number of points redeemed. (3%)  
9) Display the name and occupation of the members of a particular family name. (3%)  
10) Display the sum of points of the members of a particular family ID. (3%)  
11) Display the customer name with the maximum number of collected points. (3%)  
12) Find the total number of points redeemed on a particular date. (3%)  
13) Find the number of prizes redeemed by a particular customer id. (3%)  
14) Find the number of customers who redeemed prizes from a particular center id. (3%)  
15) Find the total number of prizes in the database. (3%)  
16) Display a list of customer names living in Fairfax and whose occupation is Engineer. (2.5%)  
17) Find the list of products not included in any tansaction. (3%)  
18) Find the product bought the most by customers. (3%)  


**Part 3 (25%):**  
In this part, the LoyaltyFirst developers ask you to develop a simple standalone application in Java
to test the results of Oracle SQL queries. The application consists of 2 main Java Swing JFrames.
The first JFrame in Figure 1 contains the connection parameters for accessing the Oracle database
server.  
![image](https://user-images.githubusercontent.com/71203848/207955649-543b15e1-2a02-440c-92ca-bacd05004b2a.png)
![image](https://user-images.githubusercontent.com/71203848/207955657-b3d6dd42-22a7-4383-a3be-4da1042a804b.png)
Note that the user can enter any Oracle Server parameters (not necessarily the GMU Oracle Server
parameters as demonstrated below). Once the Connect button is clicked and the connection is
successful, the application displays the JFrame demonstrated in Figure 2. Very simply, the user
can enter any SQL DML query statement (SELECT, DELETE, INSERT INTO, UPDATE) and
execute it. If the SQL statement is a SELECT statement, the result is displayed in a JTable
component. The JTable should dynamically figure out the number and names of columns in the
SQL result and display it on the screen. You may use the ojdbc10.jar JDBC drivers (posted on
Blackboard) from Oracle for supporting the database connections. You should package your
application in a single Java JAR file containing all the application dependencies including the
JDBC drivers needed for the connection to the database. Name the file querydisplay.jar.  

