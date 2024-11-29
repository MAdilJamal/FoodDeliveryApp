# FoodDeliveryApp

## Contents
- [About](#About)
- [Glimpse](#Glimpse)
- [Features](#Features)
- [Setup](#Setup)
- [License](#License)
- [Declaration](#Declaration)

## About
<p>FoodDeliverApp is a small web application developed in ASP.Net of .Net Framework using Web Forms and C#, for databse I used MS SQL Server v20</p>

## Glimpse
<video width="600" height="338" controls>
  <source src="/Resources/video.mp4" type="video/mp4">
</video>

An Online Food Ordering Website!

## Features
<h3>Registration</h3>
<p>To register as a new user</p>
<img src="/Resources/register-page-ui.png" width="600" height="338"/>

<h3>Login</h3>
<p>To login as a registered user</p>
<img src="/Resources/login-page-ui.png" width="600" height="338"/>

<h3>Dashboard</h3>
<p>To display available items to buy</p>
<img src="/Resources/dashboard-ui.png" width="600" height="338"/>

<h3>Order History</h3>
<p>To display previously placed orders</p>
<img src="/Resources/order-history-page.png" width="600" height="338"/>

## Setup
<p>1. Download the repository from github, extract the zip folder, open Visual Studio and Go to File > Open > Website and select the extracted folder.</p>
<p>2. Again go to the extracted folder, in parent directory open 'DB_Script_FoodDeliveryApp.sql' file in SQL Server Management Studio v12 or later and click 'execute'. This will create a new database named as 'FoodDeliveryAppDB' with all the required tables and stored procedures.</p>
<p>3. Now Go to Visual Studio again and open 'web.config' file from Solution Explorer and change the name of the server in the connection string of the project according to your server name.</p>
<p>4. Write click on 'Login.aspx' file in Solution Explorer and then click 'Set As Start Page' option.</p>
<p>That's it! start the project and you are ready to go.</p>

## License
NA

## Declaration
<p>The whole project including the frontend, backend and database is design & developed individually by myself and no other person was involved in the developement of this project.</p>
