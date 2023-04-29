#!/bin/bash

# Set the base URL of your API
BASE_URL="http://localhost:3001/api/categories"

# Test GET all categories
echo -e "\033[1;4mTesting GET all categories:\033[0m"
curl -s -X GET $BASE_URL | jq '.[] | {id: .id, category_name: .category_name, products: [.products[] | {product_id: .id, product_name: .product_name, price: .price, stock: .stock, category_id: .category_id}]}'

# Create new category
echo -e "\033[1;4mTesting POST a new category:\033[0m"
NEW_CATEGORY=$(curl -s -X POST -H "Content-Type: application/json" -d '{"category_name": "Test Category"}' $BASE_URL)
echo $NEW_CATEGORY | jq
NEW_CATEGORY_ID=$(echo $NEW_CATEGORY | jq '.id')

# Retreive category by ID
echo -e "\033[1;4mTesting GET a specific category by ID:\033[0m"
curl -s -X GET $BASE_URL/$NEW_CATEGORY_ID | jq

# Update the Categories name to Updated Test
echo -e "\033[1;4mTesting PUT (update) a category by ID:\033[0m"
curl -s -X PUT -H "Content-Type: application/json" -d '{"category_name": "Updated Test"}' -w "\nStatus code: %{http_code}\n" -o updated_category.json $BASE_URL/$NEW_CATEGORY_ID

# Display the effected number of rows in DB
echo -e "\033[1;4mEffected number of rows in DB:\033[0m"
cat updated_category.json | jq

# Get updated category by ID
echo -e "\033[1;4mTesting GET the updated category:\033[0m"
curl -s -X GET $BASE_URL/$NEW_CATEGORY_ID | jq

# Test DELETE a category by ID
echo -e "\033[1;4mTesting DELETE a category by ID:\033[0m"
DELETED_CATEGORY=$(curl -s -X DELETE $BASE_URL/$NEW_CATEGORY_ID)
echo $NEW_CATEGORY_ID | jq

# Get deleted category by ID (expect falsey)
echo -e "\033[1;4mTesting GET the deleted category (expecting an error):\033[0m"
curl -s -X GET $BASE_URL/$NEW_CATEGORY_ID | jq

# Verify deltion against all categories
echo -e "\033[1;4mTesting GET all categories:\033[0m"
curl -s -X GET $BASE_URL | jq '.[] | {id: .id, category_name: .category_name, products: [.products[] | {product_id: .id, product_name: .product_name, price: .price, stock: .stock, category_id: .category_id}]}'




