# MarketPlaceApp
<h2>Backend for market place app</h2>
<ol>
<li> Clone or Download zip file</li>
<li> Extract to desire location</li>
<li> You must have a SQL Server 2017 or Above Version
   <ul>
    <li>To run the scripts for Azure Instance use: MarketPlaceAzure2016.sql (Not Tested) </li>
    <li> For Stand Alone Instance you can use: </li>
      <ul>
        <li>MarketPlaceStandAloneFor2017Enterprise.sql</li> 
        <li>MarketPlaceDB_Final.bak file</li>
    </ul>
  </ul>
</li>
<li> Edit Market Place App Web.Config - connectionStrings to point your database,
   you're free to use integrated security or not, in both case you must 
   provide a user with permissions to read, select, update, delete, create, execute, etc, on the database.</li>
<li> Run </li>

<li> Clone or Download Market Place App UI</li>
<li> Extract to desire folder</li>
<li> Open command pront and navigate to project folder</li>
<li> Install dependencies "npm -i or npm install", note: you need node, angular-cli</li>
<li> After all dependencies have been installed you can run the app with "ng serve --open"</li>
</ol>
<hr/>

# (*) Considerations
  Login functionality is not implemented is just to test purpose
  created user are:
  userId: 111111
  userPass: whatever text you want i.e password

  userId: 123456
  userPass: whatever text you want i.e password

  You must simulate the login in order to test the add product to cart functionality is you dont
  and alert will appear when you try to use the add to cart button.

# (*) Functionality
  1. List of products.
  2. Search products.
  3. Product detail.
  4. Add products to the shopping cart.
  5. Shopping cart detail.
  6. Remove products from the shopping cart.
  7. Display the products by category.
  
(*) Third Party Libraries
  No third party libraries have been used for backend
  For FrontEnd you can find all libraries and dependencies used in package.json
  
