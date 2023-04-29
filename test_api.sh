#!/bin/bash

# Set the base URL of your API
BASE_URL="http://localhost:3001/api/categories"

# Test GET all categories
echo "Testing GET all categories:"
curl -s -X GET $BASE_URL | jq

