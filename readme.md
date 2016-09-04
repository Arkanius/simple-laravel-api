# Laravel Simple API


## Admin routes
    Just a API developed with Laravel Framework

#### Get All Users
* [Endpoint]  -   http://yourlocalhost.dev/v1/admin/users
* [method] - GET
* [Description] - If you are admin, you can see all the details of all users<br>
* [user_type] -  admin


#### Update User
* [Endpoint]  -   http://yourlocalhost.dev/v1/admin/users/{userId}
* [method] - PUT
* [Description] - Method used to update all users data<br>
* [user_type] -  admin

#### Suspend user access
* [Endpoint]  -   http://yourlocalhost.dev/v1/admin/users/{id}/suspend
* [method] - POST
* [Description] - Method used to suspend some user. Status "2" is used to represent that the user is suspended<br>
* [user_type] -  admin

#### Delete User
* [Endpoint]  -   http://yourlocalhost.dev/v1/admin/users/{id}/
* [method] - DELETE
* [Description] - Method used to delete  some user. Status "0" is used to represent that the user was deleted<br>
* [user_type] -  admin

#### Get all deleted users
* [Endpoint]  -   http://yourlocalhost.dev/v1/admin/users-deleted
* [method] - GET
* [Description] - Method used to list all deleted users
* [user_type] -  admin

#### Lookup endpoint
* [Endpoint]  -   http://yourlocalhost.dev/v1/admin/lookup
* [method] - GET
* [Description] - All endpoint supported by admin
* [user_type] -  admin


## Public routes

#### Sign in
* [Endpoint]  -   http://yourlocalhost.dev/v1/register
* [method] - POST
* [Description] - Public endpoint used to registrate users.  After registration, the user will receive an email with api_gey and api_secret
* [user_type] -  user

#### Login
* [Endpoint]  -   http://yourlocalhost.dev/v1/authenticate
* [method] - POST
* [Description] - Endpoint used to authentication. All users must give api_key and api_secret params to get back a token
* [user_type] -  user

#### Public lookup
* [Endpoint]  -   http://yourlocalhost.dev/v1/lookup
* [method] - GET
* [Description] - All endpoint supported by common users
* [user_type] -  user


## Installation

Make sure that you have php composer installed in your computer. If so, just run _composer install_ on the root path. When finish you can create the database tables with Eloquent's migrations. Just run _php artisan migrate_ and then _php artisan db:seed_ to populate the table. Or just use database.dump in dump path


