RED='\033[0;31m'
GREEN='\033[0;32m'

echo "Checking for Terraform Plan changes..."

if jq -e '.resource_changes[] |
  select(.change.actions[] | contains("delete")) |
  select(.type | contains("cpln_secret") | not)' terraform/tetris/plan.json;
then
  echo -e "${RED}ERROR: Protected resource destroy was found in Terraform Plan. Exiting."
  exit 1
fi

echo -e "${GREEN}No protected resource destroys were found in Terraform Plan. Continuing."
