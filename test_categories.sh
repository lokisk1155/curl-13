#!/bin/bash

# base url endpoint for this file
BASE_URL="http://localhost:3001/api/categories"

# post '/' : Create new category
echo -e "\033[1;4mTesting POST a new category:\033[0m"
NEW_CATEGORY=$(curl -s -X POST -H "Content-Type: application/json" -d '{"category_name": "Test Category"}' $BASE_URL)
NEW_CATEGORY_DATA=$(echo $NEW_CATEGORY | jq -r 'if has("data") then .data else . end')
NEW_CATEGORY_ID=$(echo $NEW_CATEGORY_DATA | jq '.id')
echo -e "ID: $NEW_CATEGORY_ID Name: Test Category"

# get '/:id' : Get newly made category by ID
echo -e "\033[1;4mTesting GET a specific category by ID:\033[0m"
curl -s -X GET $BASE_URL/$NEW_CATEGORY_ID | jq

# put /:id' : Update the categories name to Updated Test
echo -e "\033[1;4mTesting PUT (update) a category by ID:\033[0m"
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X PUT -H "Content-Type: application/json" -d '{"category_name": "Updated Category Name"}' $BASE_URL/$NEW_CATEGORY_ID)
echo "HTTP Status: $HTTP_STATUS"

# get '/:id' : Get updated category by ID
echo -e "\033[1;4mTesting GET the updated category:\033[0m"
curl -s -X GET $BASE_URL/$NEW_CATEGORY_ID | jq

# delete '/:id' : Delete a category by ID
echo -e "\033[1;4mTesting DELETE a category by ID:\033[0m"
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X DELETE $BASE_URL/$NEW_CATEGORY_ID)
echo "HTTP Status: $HTTP_STATUS"

# get '/:id' : expect an error : Get deleted category by ID 
echo -e "\033[1;4mTesting GET the deleted category (expecting an error):\033[0m"
curl -s -X GET $BASE_URL/$NEW_CATEGORY_ID | jq

# get '/' : GetAll : Verify deletion against all categories
echo -e "\033[1;4mTesting GET all categories:\033[0m"
curl -s -X GET $BASE_URL | jq '.[] | {id: .id, category_name: .category_name, products: [.products[] | {product_id: .id, product_name: .product_name, price: .price, stock: .stock, category_id: .category_id}]}'

