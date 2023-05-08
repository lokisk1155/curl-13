#!/bin/bash

# base url endpoint for this file
BASE_URL="http://localhost:3001/api/categories"

function test_name() {
  echo -e "\033[1;4m$1:\033[0m"
}

function print() {
  echo $1 
}

# post '/' : Create new category
test_name "Testing POST a new category"
NEW_CATEGORY=$(curl -s -X POST -H "Content-Type: application/json" -d '{"category_name": "Test Category"}' $BASE_URL)
NEW_CATEGORY_ID=$(echo $NEW_CATEGORY | jq '.id')
print "ID: $NEW_CATEGORY_ID Name: Test Category"

# get '/:id' : Get newly made category by ID
test_name "Testing GET a specific category by ID"
curl -s -X GET $BASE_URL/$NEW_CATEGORY_ID | jq

# put /:id' : Update the categories name to Updated Test
test_name "Testing PUT (update) a category by ID"
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X PUT -H "Content-Type: application/json" -d '{"category_name": "Updated Category Name"}' $BASE_URL/$NEW_CATEGORY_ID)
print "HTTP Status: $HTTP_STATUS"

# get '/:id' : Get updated category by ID
test_name "Testing GET the updated category"
curl -s -X GET $BASE_URL/$NEW_CATEGORY_ID | jq

# delete '/:id' : Delete a category by ID
test_name "Testing DELETE a category by ID"
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X DELETE $BASE_URL/$NEW_CATEGORY_ID)
print "HTTP Status: $HTTP_STATUS"

# get '/:id' : expect an error : Get deleted category by ID 
test_name "Testing GET the deleted category (expecting an error)"
curl -s -X GET $BASE_URL/$NEW_CATEGORY_ID | jq

# get '/' : GetAll : Verify deletion against all categories
test_name "Testing GET all categories"
curl -s -X GET $BASE_URL | jq
