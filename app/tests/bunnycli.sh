# debug
set -x

# never good to rush into things
sleep 10

echo '-- extracting information about the pull request'
# finding environment id from PR
envid=$(curl -s -X 'GET' "https://api.environments.bunnyshell.com/api/projects/$PROJECT/environments?page=1" \
  -H 'accept: application/ld+json' \
  -H "X-AUTH-TOKEN: $AUTH_TOKEN" | grep -Po "id.*$GIT_BRANCH" | sed -E 's#.*"id":"?([^,"]*)"?.*#\1#')

[[ -z "$envid" ]] && { echo "envid is empty" ; exit 1; }
  
unique=$(curl -s -X 'GET' "https://api.environments.bunnyshell.com/api/projects/$PROJECT/environments?page=1" \
  -H 'accept: application/ld+json' \
  -H "X-AUTH-TOKEN: $AUTH_TOKEN" | grep -Po "id.*$GIT_BRANCH" | sed -E 's/.*"unique":"?([^,"]*)"?.*/\1/')

[[ -z "$unique" ]] && { echo "envid is empty" ; exit 1; }

# Get the status
while ! curl -s -X 'GET' \
  "https://api.environments.bunnyshell.com/api/environments/$envid" \
  -H 'accept: application/ld+json' \
  -H "X-AUTH-TOKEN: $AUTH_TOKEN" | grep "status.*running" 
do
  echo "-- waiting for deployment to be ready"
  sleep 10
done

echo "-- performing tests"
sleep 10

curl "https://api-$unique.bunnyenv.com/" 
curl "https://api-$unique.bunnyenv.com/" | grep "bunnyshell-neo.*is_amazing" && echo "-- test SUCCESSFUL" || echo "-- test FAILED"
