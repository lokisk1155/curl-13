# Automated Testing for Module 13 with Curl

This repository provides a set of shell scripts for students and teachers to use automated curl routes for testing projects. The test files provided in this repo are designed for an API with the following endpoints for categories, products, and tags:

Categories:
- `POST /api/categories`
- `GET /api/categories/:id`
- `PUT /api/categories/:id`
- `DELETE /api/categories/:id`

Products:
- `POST /api/products`
- `GET /api/products/:id`
- `PUT /api/products/:id`
- `DELETE /api/products/:id`

Tags:
- `POST /api/tags`
- `GET /api/tags/:id`
- `PUT /api/tags/:id`
- `DELETE /api/tags/:id`

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

If you encounter issues while running the shell scripts, consider the following common errors and their solutions:

1. **Reminder**: If an error occurs when testing any endpoint, it will cause the test to fail even if the endpoint is functioning correctly. In such cases, carefully review the server logs to find the issue.

2. **Header's Server Error**: If the "get all" test does not return a value, it may be due to multiple responses coming back from the server. Ensure that students are not sending multiple status responses in their code. Often student's will experience this error attempting to res a bad status inside a try block if the response is bad, but they forget to return early so both responses are sent.

3. **POST route issues**: If all tests fail except for the "get all" test, but the created item is visible in the "get all" results, the issue might lie within the POST route. This is a common problem in the `test_products` script, where students may not use optional chaining on `product.tagIds.length`, leading to an error if `tagIds` is undefined or null.

4. **SequelizeServerError**: Students may encounter a `SequelizeServerError` if their ORM methods are incorrect. This issue is often caused by incorrect associations in the Sequelize models. Review the model associations to ensure they are properly set up and correspond to the desired database structure.

If the issue persists, consider revisiting the API implementation and verifying the expected responses and data formats.

### Additional Resources

For more information on API testing, check out the following resources:

- [curl Documentation](https://curl.se/docs/)
- [Introduction to API Testing: Learn the Basics](https://www.softwaretestinghelp.com/api-testing-tutorial/)

### Contributing and Feedback

If you'd like to contribute to this project or provide feedback, feel free to:

1. Fork the repository and create a new branch for your changes.
2. Submit a pull request with a description of the changes you've made.

Please ensure your changes adhere to the existing code style and structure for consistency. We appreciate your contributions and look forward to your feedback!



