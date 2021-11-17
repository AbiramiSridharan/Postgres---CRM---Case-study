Book database
create table bookdetails(bookid varchar,title varchar,kindle varchar,ebook varchar,genre varchar,authorid varchar);

\copy bookdetails(bookid,title,kindle,ebook,Genre,authorid)from 'D:\BAML\book\bookdetails\bookdetails1.csv' delimiter',' csv header;
Create table booktype(isbn varchar,format varchar,price numeric ,pubID varchar);
\copy booktype(isbn,format,price,pubID) from 'D:\BAML\book\bookdetails\booktype.csv' delimiter',' csv header;

 create table campaignresult as(select b1.campaignid ,c.campaigntype, count(*) from branch1_sale b1 join campaign c on b1.campaignid=c.campaignid group by 1,2 );
select b1.campaignid ,c.campaigntype, count(*) from branch1_sale b1 join campaign c on b1.campaignid=c.campaignid group by 1,2 );

create table campaignresult2 as(select b2.campaignid ,c.campaigntype, count(*) from branch2_sale b2 join campaignmaster c on b2.campaignid=c.campaignid group by 1,2 );

create view campaignresult2 as(select b2.campaignid ,c.campaigntype, count(*) from branch2_sale b2 join campaignmaster c on b2.campaignid=c.campaignid group by 1,2 );

UPDATE campaign SET campaignid = 'C7' where campaigntype='FB ads';
UPDATE branch2_sale SET campaignid = 'C'||(customerid%9+1);
UPDATE branch1_sale SET campaignid = 'C'||(customerid%2+7) WHERE rownumber > 4016;
  
  
  insert into branch1_sale values('20-1-2020', '989-28-79-14379-4','DY800',48313,119.9,2,239.8,'C3');
  insert into branch2_sale values('20-1-2020', '989-28-79-14379-4','48313','DY800',119.9,2,239.8,'C3');
insert into campaign(campaigntype,campaignid) select campaigntype,campaignid  from campaign group by 1,2 order by 2;


 create view view_campaignresult_b2 as(
 select b1.campaignid ,c.campaigntype, count(*) from branch2_sale b1 join campaignmaster c on b1.campaignid=c.campaignid group by 1,2 
 );

insert into campaignmaster (campaigntype,campaignid) select campaigntype,campaignid  from campaign group by 1,2;

select  bookid from bookdetails group by 1 having count(*)=2 ;
 update  bookdetails set bookid='TT172' where title='Polar Bears at the Zoo';
 
 
 
 SELECT b.branchid, count(*), sum(moneyspend)
FROM "campaign" AS c 
INNER JOIN "campaignmaster" ON c.campaignid = "campaignmaster".campaignid 
WHERE {{campaignid}} 
GROUP BY 1, 2;



SELECT c.campaignid, c.campaigntype, count(*), sum(moneyspend)
FROM "campaign" AS c 
INNER JOIN "campaignmaster" ON c.campaignid = campaignmaster.campaignid 
WHERE "campaignmaster".campaignid IN ('C1','C5') 
GROUP BY 1, 2;


SELECT c.campaignid, c.campaigntype, count(*), sum(moneyspend)
FROM "campaign" AS c "campaignmaster" 
WHERE c.campaignid = "campaignmaster".campaignid 
AND campaignmaster.campaignid IN ('C1','C5') 
GROUP BY 1, 2;


 create table BranchMaster( BranchID varchar, branchName varchar,Address varchar,city varchar,state varchar,pincode int, Managerid varchar,Managername varchar);
\copy BranchMaster( BranchID , branchName ,Address ,city ,state ,pincode, Managerid,Managername)from 'D:\BAML\book\branchmaster\branchMaster.csv' delimiter',' csv header;

\copy BranchSaleMaster( SaleDate,ISBN,BranchID,BookID,customerid,price,Qty,amount )from 'D:\BAML\book\branchmaster\branchsaleMaster.csv' delimiter',' csv header;

create table BranchSaleMaster(saledate date ,isbn varchar,BranchID varchar,bookid varchar,customerid int,price numeric,qty int,amount numeric);

create table customermaster(customerid varchar,first_name varchar,last_name varchar,email varchar,gender varchar,mobile bigint ,address varchar,city varchar,State varchar,Country varchar,CountryCode varchar,CampaignID varchar,customerType varchar);

\copy customermaster(customerid,first_name,last_name,email,gender,mobile,address,city,State,Country,CountryCode,CampaignID,customerType)from 'D:\BAML\book\customer details\customerMaster.csv' delimiter ',' csv header;

create table publisher(PubID varchar,PublishingHouse varchar,City varchar,State varchar,Country varchar,YearEstablished int,MarketingSpend_year numeric);
\copy publisher(PubID,Publishing House,City,State,Country,YearEstablished,MarketingSpend_year)from "D:\BAML\book\publisher\publisherDetails.csv" delimiter ',' csv header;

create table author(AuthID varchar ,FirstName varchar ,LastName varchar,Country varchar); 
\copy author(AuthID,FirstName,LastName,Country)from 'D:\BAML\book\author\author.csv' delimiter ',' csv header;


create table Rating(BookID varchar,Rating int,CustomerID varchar ,ReviewID big int); 
\copy rating(BookID,Rating,CustomerID,ReviewID) from 'D:\BAML\book\Rating\Rating1.csv' delimiter ',' csv header;
\copy (select BookID,Rating,CustomerID,ReviewID from Rating) to 'D:\BAML\book\Rating\Rating.csv' delimiter ',' csv header;

Create table onlineSale(OrderID varchar,OrderDate date,ShipDate date,ShipMode varchar,CustomerID varchar,CustomerName varchar,City varchar,State varchar,Country varchar,bookid varchar,price numeric,Qty int ,ShippingCost int,Amount numeric);

\copy onlinesale(OrderID,OrderDate,ShipDate,ShipMode,CustomerID,CustomerName,City,State,Country,bookid,price,Qty,ShippingCost,Amount) from 'D:\BAML\book\onlineSale' delimiter ',' csv header;
\copy (select OrderID,OrderDate,ShipDate,ShipMode,CustomerID,CustomerName,City,State,Country,bookid,price,Qty,ShippingCost,Amount, countrycode from onlinesale) to 'D:\BAML\book\onlineSale\onlinesale.csv' delimiter ',' csv header;
 
 create table temp ( country varchar,alpha_code varchar);
 

UPDATE onlinesale as o SET o.countryCode = temp.ALPHA_CODE FROM temp WHERE o.country = temp.country;


SELECT count(DISTINCT o.country), count(DISTINCT temp.ALPHA_CODE) FROM onlinesale as o  LEFT join temp ON o.country = temp.country;

SELECT count(*) FROM onlinesale as o LEFT join temp ON o.country = temp.country WHERE o.country_code IS N
update onlinesale set country = replace(country,' ', '');

create table returns(returned varchar,customerid varchar);
\copy returns (returned,customerid) from 'D:\BAML\book\Rating\Rating1\book\Returns\returns.csv' delimiter ',' csv header;

alter table returnmaster add column country varchar, amount numeric;
UPDATE returnmaster as r SET amount= o.amount FROM onlinesale as o WHERE o.orderid = r.orderid;
UPDATE returnmaster as r SET country= o.country FROM onlinesale as o WHERE o.orderid = r.orderid;

 \copy (select returned,orderid,country,amount from returnmaster) to 'D:\BAML\book\Returns\returns-new.csv' delimiter',' csv header;
 
 
         ^
 \copy (SELECT DISTINCT ON (customerid) customerid,customername,city,state,country,countrycode FROM onlinesale ORDER BY customerid, orderdate) to 'D:\BAML\book\customer details\temp1.csv' delimiter ',' csv header ;

