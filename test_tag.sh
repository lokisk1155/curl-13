#!/bin/bash

#!/bin/bash

# Set the base URL of your API
BASE_URL="http://localhost:3001/api/tags"

# Get all tags
echo -e "\033[1;4mTesting GET all tags:\033[0m"
curl -s -X GET $BASE_URL | jq
