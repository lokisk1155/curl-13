#!/bin/bash

# Set the base URL of your API
BASE_URL="http://localhost:3001/api/products"

# Create new product
echo -e "\033[1;4mTesting POST a new product:\033[0m"
NEW_PRODUCT=$(curl -s -X POST -H "Content-Type: application/json" -d '{"product_name": "Test Product", "price": 10, "stock": 5, "category_id": 1}' $BASE_URL)
echo $NEW_PRODUCT | jq
NEW_PRODUCT_ID=$(echo $NEW_PRODUCT | jq '.id')

# Retrieve product by ID
echo -e "\033[1;4mTesting GET a specific product by ID:\033[0m"
curl -s -X GET $BASE_URL/$NEW_PRODUCT_ID | jq



