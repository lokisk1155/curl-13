#!/bin/bash

# base url endpoint for this file
BASE_URL="http://localhost:3001/api/products"

# Function to display test name
function test_name() {
  echo -e "\033[1;4m$1:\033[0m"
}

# POST '/' : Create new product
test_name "Testing POST a new product"
NEW_PRODUCT=$(curl -s -X POST -H "Content-Type: application/json" \
  -d '{"product_name": "Test Product", "price": 10, "stock": 5, "category_id": 1}' \
  $BASE_URL)
NEW_PRODUCT_ID=$(echo $NEW_PRODUCT | jq '.id')
echo -e "ID: $NEW_PRODUCT_ID Name: Test Product"

# GET '/:id' : Get newly made product by ID
test_name "Testing GET a specific product by ID"
curl -s -X GET $BASE_URL/$NEW_PRODUCT_ID | jq

# PUT /:id' : Update the product name to Updated Test Product
test_name "Testing PUT (update) a product by ID"
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X PUT -H "Content-Type: application/json" \
-d '{"product_name": "Updated Test Product"}' $BASE_URL/$NEW_PRODUCT_ID)
echo "HTTP Status: $HTTP_STATUS"

# GET '/:id' : Get updated product by ID
test_name "Testing GET the updated product"
curl -s -X GET $BASE_URL/$NEW_PRODUCT_ID | jq

# DELETE '/:id' : Delete product by ID
test_name "Testing DELETE a product by ID"
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X DELETE $BASE_URL/$NEW_PRODUCT_ID)
echo "HTTP Status: $HTTP_STATUS"

# GET '/:id' : Expect an error : Get deleted product by ID
test_name "Testing GET the deleted product (expecting an error)"
curl -s -X GET $BASE_URL/$NEW_PRODUCT_ID | jq

# GET '/' : GetAll : Verify deletion against all products
test_name "Testing GET all products"
curl -s -X GET $BASE_URL | jq
