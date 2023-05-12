# Automated Testing for Module 13 with Curl

Module 13 aims to equip full-stack web developers with the skills required to build the back end for an e-commerce platform, a critical component in today's internet retail industry. By modifying starter code, you will create an Express.js API that utilizes Sequelize to interact with a MySQL database, which is a common architecture in e-commerce platforms like Shopify and WooCommerce. This API allows users to perform CRUD operations on categories, products, and tags, ensuring that your e-commerce platform remains competitive.

To help verify that the API is functioning correctly and meets all acceptance criteria, this document provides a set of shell scripts for automated testing using curl and step-by-step instructions for setting up the testing environment on macOS and Windows operating systems.

By following the instructions in this document, you will be able to test your API implementation and troubleshoot any issues that may arise during development. 

| Categories              | Products               | Tags                  |
|-------------------------|------------------------|-----------------------|
| POST /api/categories    | POST /api/products     | POST /api/tags        |
| GET /api/categories/:id | GET /api/products/:id  | GET /api/tags/:id     |
| PUT /api/categories/:id | PUT /api/products/:id  | PUT /api/tags/:id     |
| DELETE /api/categories/:id | DELETE /api/products/:id | DELETE /api/tags/:id |

[Quick Demo](https://www.loom.com/share/1b133c22c9c141b3a78214d58e526cf0)

## Prerequisites

Before using this repo, ensure you have the following software installed on your system:

- [curl](https://curl.se/download.html)
- [jq](https://stedolan.github.io/jq/download/) (a lightweight and flexible command-line JSON processor)

## Installation

1. Install curl by following the instructions provided in the [official documentation](https://curl.se/download.html) for your operating system.
2. Install jq by following the instructions provided in the [official documentation](https://stedolan.github.io/jq/download/) for your operating system.
3. Clone this repository to your local machine.

## Getting Started

1. Open your terminal or command prompt.
2. Navigate to the directory where the shell scripts `test_categories.sh`, `test_products.sh`, and `test_tags.sh` are located.
3. Use the `chmod` command to make the scripts executable by typing:
```
chmod +x test_categories.sh test_products.sh test_tags.sh
```
4. Now that the scripts are executable, you can run them using:
```
./test_categories.sh
./test_products.sh
./test_tags.sh
```

## Shell Scripts Overview

`test_categories.sh`, `test_products.sh`, and `test_tags.sh` are shell scripts that test the API endpoints for categories, products, and tags respectively. Each script performs the following tests:

1. POST a new item (category, product, or tag)
2. GET the newly made item by ID
3. PUT (update) an item by ID
4. GET the updated item
5. DELETE an item by ID
6. GET the deleted item (expecting an error)
7. GET all items

## Troubleshooting Common Errors

While running the shell scripts, you may encounter some issues. Consider the following common errors and their solutions to help you resolve these problems:

1. **Test fails but database change is successful**: Sometimes, an error might occur when testing an endpoint, causing the test to fail even if the endpoint is functioning correctly. In such cases, carefully review the server logs to identify the issu

2. **Header's Server Error**: If the "get all" test fails to return a value, it could be due to multiple responses coming back from the server. Make sure you're not sending multiple status responses in your code. This error often occurs when trying to send a bad status inside a try block without returning early, resulting in multiple responses being sent.

3. **POST route issues**: If all tests fail except for the "get all" test, and the created item is visible in the "get all" results, the issue might lie within the POST route. A common problem in the test_products script is the lack of optional chaining on product.tagIds.length, which can lead to an error if tagIds is undefined or null.

4. **SequelizeServerError**: You may encounter a SequelizeServerError if the ORM methods are incorrect. This issue is often caused by improper associations in the Sequelize models. Review the model associations to ensure they are correctly set up and correspond to the desired database structure.

5. **SequelizeEagerLoadingError**: This error is commonly encountered when trying to include the Product or Tag model in a Sequelize query without specifying the "through: ProductTag" parameter. This parameter is critical as it informs Sequelize of the intermediate model to use for establishing the relationship between the Product and Tag models. Without it, Sequelize cannot determine the correct instances to retrieve from the database. Consequently, always ensure to specify the "through" clause when eager loading associated models in Sequelize.

### Additional Resources

For more information on API testing, check out the following resources:

- [How to use curl](https://www.youtube.com/watch?v=BuEYquQweGo)
- [What is a RESTful API?](https://www.youtube.com/watch?v=lsMQRaeKNDk)
- [Using curl better with creator Daniel Stenberg](https://www.youtube.com/watch?v=I6id1Y0YuNk)

### Contributing and Feedback

If you'd like to contribute to this project or provide feedback, feel free to:

1. Fork the repository and create a new branch for your changes.
2. Submit a pull request with a description of the changes you've made.

Please ensure your changes adhere to the existing code style and structure for consistency. We appreciate your contributions and look forward to your feedback!



