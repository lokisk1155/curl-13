#!/bin/bash

# base url endpoint for this file
BASE_URL="http://localhost:3001/api/products"

# post '/' : Create new product
echo -e "\033[1;4mTesting POST a new product:\033[0m"
NEW_PRODUCT=$(curl -s -X POST -H "Content-Type: application/json" -d '{"product_name": "Test Product", "price": 10, "stock": 5, "category_id": 1}' $BASE_URL)
NEW_PRODUCT_ID=$(echo $NEW_PRODUCT | jq '.id')
echo -e "ID: $NEW_PRODUCT_ID Name: Test Product"

# get '/:id' : Get newly made product by ID
echo -e "\033[1;4mTesting GET a specific product by ID:\033[0m"
curl -s -X GET $BASE_URL/$NEW_PRODUCT_ID | jq

# put /:id' : Update the product name to Updated Test Product
echo -e "\033[1;4mTesting PUT (update) a product by ID:\033[0m"
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X PUT -H "Content-Type: application/json" -d '{"product_name": "Updated Test Product"}' $BASE_URL/$NEW_PRODUCT_ID)
echo "HTTP Status: $HTTP_STATUS"

# get '/:id' : Get updated product by ID
echo -e "\033[1;4mTesting GET the updated product:\033[0m"
curl -s -X GET $BASE_URL/$NEW_PRODUCT_ID | jq

# delete '/:id' : Delete product by ID
echo -e "\033[1;4mTesting DELETE a product by ID:\033[0m"
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X DELETE $BASE_URL/$NEW_PRODUCT_ID)
echo "HTTP Status: $HTTP_STATUS"

# get '/:id' : expect an error : Get deleted product by ID 
echo -e "\033[1;4mTesting GET the deleted product (expecting an error):\033[0m"
curl -s -X GET $BASE_URL/$NEW_PRODUCT_ID | jq

# get '/' : GetAll : Verify deletion against all products 
echo -e "\033[1;4mTesting GET all products:\033[0m"
curl -s -X GET $BASE_URL | jq