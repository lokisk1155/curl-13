#!/bin/bash

#!/bin/bash

# Set the base URL of your API
BASE_URL="http://localhost:3001/api/tags"

# Create a new tag
echo -e "\033[1;4mTesting POST a new tag:\033[0m"
NEW_TAG=$(curl -s -X POST -H "Content-Type: application/json" -d '{"tag_name": "New Tag"}' $BASE_URL)
NEW_TAG_ID=$(echo $NEW_TAG | jq '.id')
echo -e "ID: $NEW_TAG_ID Name: Cool new tag"

# Update a tag by ID
echo -e "\033[1;4mTesting PUT (update) a tag by ID:\033[0m"
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X PUT -H "Content-Type: application/json" -d '{"tag_name": "Updated Tag Name"}' $BASE_URL/$NEW_TAG_ID)
echo "HTTP Status: $HTTP_STATUS"

# Get updated tag by ID
echo -e "\033[1;4mTesting GET the updated tag:\033[0m"
curl -s -X GET $BASE_URL/$NEW_TAG_ID | jq


# Delete a tag by ID
echo -e "\033[1;4mTesting DELETE a tag by ID:\033[0m"
TAG_ID=1 # Replace with an existing tag ID
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X DELETE $BASE_URL/$NEW_TAG_ID)
echo "HTTP Status: $HTTP_STATUS"

# Get deleted tag by ID (expect an error)
echo -e "\033[1;4mTesting GET the deleted tag (expecting an error):\033[0m"
curl -s -X GET $BASE_URL/$NEW_TAG_ID | jq

# Verify deletion against all tags
echo -e "\033[1;4mTesting GET all tags:\033[0m"
curl -s -X GET $BASE_URL | jq





