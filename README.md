# Cuisine API

The Cuisine API is a RESTful API integrated with a PostgreSQL database using the Vapor framework, catering specifically to cuisine enthusiasts seeking efficient management of a cuisine database. The backend services are meticulously designed to handle various aspects of cuisine management.

## APP STATEMENT

A RESTful API integrated with PSQL database for recipe management iOS app

## FEATURE LIST

- Creation Operation [POST]:
  - Add a new user, dish, or cuisine to the database using POST requests.     

- Fetch Operations [GET]:
    - Retrieve all users, dishes, and cuisines via GET requests.
    - Fetch a specific user, dish, or cuisine by its unique ID using GET requests.

- Modification Operations [PUT] and [DELETE]:
    - Update the information of a user, dish, or cuisine through PUT requests.
    - Delete a user, dish, or cuisine from the database using DELETE requests.

## Technologies Used

- Vapor

Vapor is a powerful server-side Swift web framework tailored for building high-performance web applications and APIs. It provides developers with the tools needed to create robust backend solutions efficiently.

- Postman

Postman is a widely-used API development tool renowned for its capabilities in testing, documenting, and managing APIs. With Postman, developers can streamline the process of API testing and interaction.

- Postico 2

Postico 2 is a popular macOS PostgreSQL client known for its user-friendly interface. It simplifies the management and interaction with PostgreSQL databases, offering a visual interface for enhanced usability.

- PostgreSQL

PostgreSQL is an open-source relational database management system renowned for its advanced features and scalability. It is ideal for handling complex data storage and retrieval requirements, providing a reliable foundation for backend data management.

##Tables and Relationships:

#### 1- Cuisines

| Parameter            | Type     | Description                |
| :--------            | :------- | :------------------------- |
| `cuisine_ID`         |  `UUID`  |     **`PRIMARY KEY`**      |
| `cuisine_Name`       | `String` |                            |
| `cuisine_Description`| `String` |                            |

Route: 
```http
  http://127.0.0.1:8080/Cuisines
```

| Request Method	  | Route   | Action                               |
| :--------------- | :------  | :----------------------------------  |
|  GET             |   /id    | Retrieve all the Cuisines            |
|  POST            |          | Creates a new Cuisine                |
|  PUT             |          | Updates an existing Cuisine by ID    |  
|  DELETE          |   /id    | Deletes an existing Cuisines by ID.  |

#### 2- Dish

| Parameter            | Type     | Description                |
| :--------            | :------- | :------------------------- |
| `dish_ID`            | `UUID`   |     **`PRIMARY KEY`**      |
| `cuisine_ID`         | `cuisine`|     **`FOREIGN KEY`**      |
| `dish_Name`          | `String` |                            |
| `ingredients`        | `String` |                            |
| `price`              | `double` |                            |

Route:
```http
  http://127.0.0.1:8080/Dish
```

| Request Method	  | Route   | Action                               |
| :--------------- | :------  | :----------------------------------  |
|  GET             |   /id    | Retrieve all the Dishes              |
|  POST            |          | Creates a new Dish                   |
|  PUT             |          | Updates an existing Dish by ID       |  
|  DELETE          |   /id    | Deletes an existing Dish by ID.      |

#### 3- Users

| Parameter            | Type     | Description                   |
| :--------            | :------- | :-------------------------    |
| `User_ID`            |  `UUID`  |     **`PRIMARY KEY`**         |
| `User_Name`          | `String` |                               |

Route: 
```http
  http://127.0.0.1:8080/Users
```

| Request Method	  | Route   | Action                               |
| :--------------- | :------  | :----------------------------------  |
|  GET             |   /id    | Retrieve all the Users               |
|  POST            |          | Creates a new User                   |
|  PUT             |          | Updates an existing User by ID       |  
|  DELETE          |   /id    | Deletes an existing User by ID.      |


## Authors:
- Haifa Muhammad. 
- Nouf Sultan.
- Amal Saad.
