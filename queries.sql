SELECT OFFER_ID, ACTION,O_DATE from OFFERS; --1 
SELECT TRANSACTIONS.TREF, TRANSACTIONS.AMOUNT, TRANSACTIONS.T_POINTS, T_DATE, CUSTOMERS.CNAME from TRANSACTIONS 
join CUSTOMERS USING(CID)
where CNAME = 'Li David' ; --2

SELECT  COUNT( OFFER_ID) AS "Branch Count", BRANCH_ID FROM OFFERS_BRANCHES GROUP BY BRANCH_ID; --3

SELECT  BRANCHES.BRANCH_NAME,COUNT( OFFER_ID) AS "Branch Count" FROM OFFERS_BRANCHES
JOIN BRANCHES ON OFFERS_BRANCHES.BRANCH_ID = BRANCHES.BRANCH_ID
 GROUP BY BRANCHES.BRANCH_NAME; --4

SELECT TREF, T_DATE, T_TIME, AMOUNT, T_POINTS, PROD_NAME FROM TRANSACTIONS
JOIN TRANSACTIONS_PRODUCTS USING(TREF) 
JOIN PRODUCTS ON PRODUCTS.PROD_ID=TRANSACTIONS_PRODUCTS.PROD_ID 
WHERE TREF = (SELECT TREF FROM TRANSACTIONS WHERE TREF ='a1'); --5

SELECT EXP_DATE FROM CARDS;--6
SELECT CNAME FROM CARDS 
JOIN CUSTOMERS ON CUSTOMERS.CID =CARDS.CID  WHERE EXP_DATE =(SELECT MAX(EXP_DATE) FROM CARDS);--7

SELECT  CNAME,PRIZES.PRIZE_ID, P_DESCRIPTION,CENTER_ID,POINT_ACCT_NO FROM REDEMPTION_HISTORY
JOIN CUSTOMERS ON CUSTOMERS.CID = REDEMPTION_HISTORY.CID
JOIN PRIZES ON PRIZES.PRIZE_ID = REDEMPTION_HISTORY.PRIZE_ID
WHERE CNAME = (SELECT CNAME FROM CUSTOMERS WHERE CNAME = 'Bran Miller' ); --8

SELECT CNAME, OCCUPATION FROM CUSTOMERS 
WHERE FAMILY_ID =(SELECT FAMILY_ID FROM FAMILIES WHERE FAMILY_NAME ='Johnson'); --9

SELECT SUM(NUM_OF_POINTS) AS "TOTAL FAMILY POINTS" FROM POINT_ACCOUNTS
WHERE FAMILY_ID =(SELECT FAMILY_ID FROM FAMILIES WHERE FAMILY_ID =4); --10

SELECT  CNAME FROM CUSTOMERS
JOIN POINT_ACCOUNTS ON POINT_ACCOUNTS.CID = CUSTOMERS.CID
WHERE NUM_OF_POINTS = (SELECT MAX(NUM_OF_POINTS) FROM POINT_ACCOUNTS); --11

SELECT R_DATE,SUM(NUM_OF_POINTS) AS "TOTAL POINTS" FROM POINT_ACCOUNTS
JOIN REDEMPTION_HISTORY ON POINT_ACCOUNTS.POINT_ACCT_NO = REDEMPTION_HISTORY.POINT_ACCT_NO
WHERE R_DATE = (SELECT R_DATE FROM REDEMPTION_HISTORY
WHERE R_DATE = '20-NOV-20')
GROUP BY R_DATE; --12

SELECT COUNT(PRIZE_ID) AS "NUMBER OF PRIZES REDEEM" FROM REDEMPTION_HISTORY
JOIN CUSTOMERS ON CUSTOMERS.CID = REDEMPTION_HISTORY.CID
WHERE CUSTOMERS.CID = 1;--13

SELECT COUNT(CNAME) AS NUMBER_CUSTOMER FROM CUSTOMERS
JOIN  REDEMPTION_HISTORY ON REDEMPTION_HISTORY.CID = CUSTOMERS.CID
WHERE CENTER_ID = (SELECT CENTER_ID FROM EXCHGCENTERS WHERE CENTER_ID = '2020001'); --14

SELECT COUNT(PRIZE_ID) AS "Total number of prizes" FROM PRIZES;--15

SELECT CNAME FROM CUSTOMERS 
JOIN ADDRESSES ON ADDRESSES.CID = CUSTOMERS.CID 
WHERE CITY = 'Fairfax' AND OCCUPATION = 'Engineer'; --16

SELECT PROD_NAME FROM PRODUCTS
JOIN TRANSACTIONS_PRODUCTS USING(PROD_ID)
JOIN TRANSACTIONS USING(TREF)
WHERE T_DATE NOT IN (SELECT T_DATE FROM TRANSACTIONS);--17

SELECT PROD_NAME FROM PRODUCTS
JOIN TRANSACTIONS_PRODUCTS USING(PROD_ID)
WHERE QUANTITY = (SELECT MAX(QUANTITY) FROM TRANSACTIONS_PRODUCTS); --18