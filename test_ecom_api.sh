#!/bin/bash

# Set the base URL of your API
BASE_URL="http://localhost:3001/api/categories"

# Test GET all categories
echo "Testing GET all categories:"
curl -s -X GET $BASE_URL | jq

# Test POST a new category
echo "Testing POST a new category:"
NEW_CATEGORY=$(curl -s -X POST -H "Content-Type: application/json" -d '{"name": "New Category"}' $BASE_URL)
echo $NEW_CATEGORY | jq
NEW_CATEGORY_ID=$(echo $NEW_CATEGORY | jq '.id')

# Test GET a specific category by ID
echo "Testing GET a specific category by ID:"
curl -s -X GET $BASE_URL/$NEW_CATEGORY_ID | jq

# Test PUT (update) a category by ID
echo "Testing PUT (update) a category by ID:"
curl -s -X PUT -H "Content-Type: application/json" -d '{"name": "Updated Category"}' $BASE_URL/$NEW_CATEGORY_ID | jq

# Test DELETE a category by ID
echo "Testing DELETE a category by ID:"
curl -s -X DELETE $BASE_URL/$NEW_CATEGORY_ID | jq

# Test GET all categories again to verify deletion
echo "Testing GET all categories after deletion:"
curl -s -X GET $BASE_URL | jq
