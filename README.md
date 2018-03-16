# API REST using ASP.NET, MySQL Local Database, ASP.Identity and OAuth 2.0

## About it

This is a backend system that provides an API REST for client management, requiring authentication to use it. Only "Admin" users can modify clients.

## Databases

This API REST uses 2 MySql databases. One is for the clients, and it has 3 tables: 

- Clients: Contains all the personal information of the clients
- Products: Contains products that can be acquired by the clients
- Orders: Contains relations betweent the clients and the products that they hae acquired

And the other database used is for the users, and its tables are created by ASP.NET Identity using Entity Framework. 

MySQL user used for this is: 

uid: root
password: lrairgmra1234

And the connection port has to be 3308


## Clients

The Client model can be found in PruebaCSharp/Models/Client.cs. As you can see, clients have: 

- Id
- name 
- last name
- photo (an URL to his current photo, which is store in another place) 
- list of products acquired by this client

### Functions related to client management

The functions related to HTTP (PUT, POST, GET, DELETE) are implemented in ClientController.cs

You can: 

* Create a client : See *POST* implementation. You can do it with the URI api/Client
* Modify a client: See *PUT* implementation. You can do it with the URI api/Client/id
* Delete a client: See *DELETE* implementation. You can do it with the URI api/Client/id
* Get a client: See *GET* implementation. You can do it with the URI api/Client/id
* Get all clients: See *GET* implementation. You can do it with the URI api/Client 

All these functions are only avalaible if you are a user identified as "Admin". 


## Accounts

In this section the main functions of account management will be described. 

### Register a new user
You can register a new user, making a POST request with the URI api/Account/Register and with a JSON like this:

{
"Email": "test@test.com",
"Password": "Test_123",
"ConfirmPassword": "Test_123"
}

The passwords needs to include at least one number, one capital letter, and one symbol. 

### Change user's role

You can change the role of a user making a PUT request with the URI users/{id:guid}/roles and with an array with the role you want to assign to that user. 

PUT http://localhost:port/api/Account/users/id/roles

Body: ["Admin"] 


### Get user's token

You can get a token of a user with a GET request, with the URI /Token. The token of an admin user is needed to make the requests related to the client section. 


## Testing the API REST

### Instructions 

1. Download the Github project
2. Open the solution on Visual Studio 2017
3. Open the MySQL database using, for example, MySQL Workbench 
4. Run the solution
5. A Window in a browser will appear, keep the URL. 
6. Dowload and open POSTMAN to do the requests you want (https://www.blazemeter.com/blog/how-use-postman-manage-and-execute-your-apis), or use a extension like Restles Client for Chrome. 

### Additional Information

* Before making any client request, make sure you create a user, give it a admin role, and then get the token of the user. Once you have this token, make the client requests with OAuth 2.0 authentication, and give it the token. 

