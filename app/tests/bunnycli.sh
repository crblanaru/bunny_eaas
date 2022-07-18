set -x
echo $GIT_BRANCH

# finding environment id from PR
envid=$(curl -s -X 'GET' 'https://api.environments.bunnyshell.com/api/projects/168/environments?page=1' \
  -H 'accept: application/ld+json' \
  -H "X-AUTH-TOKEN: $AUTH_TOKEN" | grep -Po "id.*$GIT_BRANCH" | sed -E 's/.*"id":"?([^,"]*)"?.*/\1/')

echo $envid
  
unique=$(curl -s -X 'GET' 'https://api.environments.bunnyshell.com/api/projects/168/environments?page=1' \
  -H 'accept: application/ld+json' \
  -H "X-AUTH-TOKEN: $AUTH_TOKEN" | grep -Po "id.*$GIT_BRANCH" | sed -E 's/.*"unique":"?([^,"]*)"?.*/\1/')

echo $unique

# Get the status
while ! curl -s -X 'GET' \
  "https://api.environments.bunnyshell.com/api/environments/$envid" \
  -H 'accept: application/ld+json' \
  -H "X-AUTH-TOKEN: $AUTH_TOKEN" | grep "status.*running" 
do
echo "wait for deployment to be ready"
sleep 10
done