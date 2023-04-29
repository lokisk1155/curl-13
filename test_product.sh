#!/bin/bash

# Set the base URL of your API
BASE_URL="http://localhost:3001/api/products"

# Create new product
echo -e "\033[1;4mTesting POST a new product:\033[0m"
NEW_PRODUCT=$(curl -s -X POST -H "Content-Type: application/json" -d '{"product_name": "Test Product", "price": 10, "stock": 5, "category_id": 1}' $BASE_URL)
NEW_PRODUCT_ID=$(echo $NEW_PRODUCT | jq '.id')
echo -e "ID: $NEW_PRODUCT_ID Name: Test Product"

# Retrieve product by ID
echo -e "\033[1;4mTesting GET a specific product by ID:\033[0m"
curl -s -X GET $BASE_URL/$NEW_PRODUCT_ID | jq

# Update the product information
echo -e "\033[1;4mTesting PUT (update) a product by ID:\033[0m"
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X PUT -H "Content-Type: application/json" -d '{"product_name": "Updated Test Product"}' $BASE_URL/$NEW_PRODUCT_ID)
echo "HTTP Status: $HTTP_STATUS"

# Get updated product by ID
echo -e "\033[1;4mTesting GET the updated product:\033[0m"
curl -s -X GET $BASE_URL/$NEW_PRODUCT_ID | jq

# Test DELETE a product by ID
echo -e "\033[1;4mTesting DELETE a product by ID:\033[0m"
DELETED_PRODUCT=$(curl -s -X DELETE $BASE_URL/$NEW_PRODUCT_ID)
echo $NEW_PRODUCT_ID | jq

# Get deleted product by ID (expect an error)
echo -e "\033[1;4mTesting GET the deleted product (expecting an error):\033[0m"
curl -s -X GET $BASE_URL/$NEW_PRODUCT_ID | jq

# Verify deletion against all products
echo -e "\033[1;4mTesting GET all products:\033[0m"
curl -s -X GET $BASE_URL | jq