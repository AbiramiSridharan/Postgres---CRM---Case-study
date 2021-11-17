# CRM_Case-study
**Book Store Profit and sale analysis**
- **Postgres & Metabase**
-  CRM DATABASE------>1.markering
					2.Sale
					3.support
 
 list of tables for book store
lookup :

 1. shop details
		state
		country
		branches- area names 
	
 2. employee details
		id-proof-aadhar,ration card etc..
		graduation- 12th, degree-bse,msc...
		City	
		State
		Country	
3. book details
		type-Young, Adult, Mystery ,Fiction,SciFi/Fantasy,Childrens,Romance

4.  publisher details
		City	
		State
		Country	
5.  campaign 
		campaign type-FB,Twitter,hoardings,newspaper ads, whatsapp etc..
		
		
Master:
 1. Shop details
		owner name
		shop address
		branches
		pincode
		Website
		blog
		phone
		landline
		
4. 	Book details
		BookID	(PK)
		Title	
		AuthID(FK)
		type-Young, Adult, Mystery ,Fiction,SciFi/Fantasy,Childrens,Romance
		ISBN no (PK)
		PubID	(FK)
		Publication Date	
		Pages
		Price
5.	publishers details
		PubID (PK)	
		Publishing House	
		City	
		State
		Country	
		Year Establishe
6.Author details
		AuthID	(PK)
		First Name	
		Last Name
		Country of Residence	
		
TRANSACTION:

1. Branchwise-Sale
		BranchID
		CustomerID(FK)
		Sale Date
		ISBN	(FK)
		BOOK ID(FK)
		Discount
		ItemID	
		OrderID
		

2.  Campaign
		campaign type-FB,Twitter, other social media
		campaign ID
		money spent
		employee ID(FK)
		current status
		reviews and response
		campaign date
3. online sales
		orderid
		orderdate
		shipdate
		shipmode
		customerid
		customername
		city
		state
		country
		bookid
		price
		qty
		shippingcost
		amount
		countrycode
4. Campaign result
		campaign type,
		capmaign id
		count of customers
5.Returns
		returned(Y/N)
		orderid
		country
		amount
6.Rating
		BookID
		Rating
		CustomerID
		ReviewID

