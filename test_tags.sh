#!/bin/bash

# base url endpoint for this file
BASE_URL="http://localhost:3001/api/tags"

function test_name() {
  echo -e "\033[1;4m$1:\033[0m"
}

# post '/' : Create new tag
test_name "Testing POST a new tag"
NEW_TAG=$(curl -s -X POST -H "Content-Type: application/json" -d '{"tag_name": "New Tag"}' $BASE_URL)
NEW_TAG_ID=$(echo $NEW_TAG | jq '.id')
echo -e "ID: $NEW_TAG_ID Name: Cool new tag"

# get '/:id' : Get newly made tag by ID
echo -e "\033[1;4mTesting GET the updated tag:\033[0m"
curl -s -X GET $BASE_URL/$NEW_TAG_ID | jq

# put /:id' : Update the tag name to Updated tag name
test_name "Testing PUT (update) a tag by ID"
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X PUT -H "Content-Type: application/json" -d '{"tag_name": "Updated Tag Name"}' $BASE_URL/$NEW_TAG_ID)
echo "HTTP Status: $HTTP_STATUS"

# get '/:id' : Get updated tag by ID
test_name "Testing GET the updated tag"
curl -s -X GET $BASE_URL/$NEW_TAG_ID | jq

# delete '/:id' : Delete a tag by ID
test_name "Testing DELETE a tag by ID"
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X DELETE $BASE_URL/$NEW_TAG_ID)
echo "HTTP Status: $HTTP_STATUS"

# get '/:id' : expect an error : Get deleted tag by ID 
test_name Testing "GET the deleted tag (expecting an error)"
curl -s -X GET $BASE_URL/$NEW_TAG_ID | jq

# get '/' : GetAll : Verify deletion against all tags
test_name "Testing GET all tags"
curl -s -X GET $BASE_URL | jq


