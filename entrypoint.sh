#!/bin/sh

if [ -z "$PUBLISH_DIR" ]
then
  echo "You must provide the action with the folder path in the repository where your compiled page generate at, example public."
  exit 1
fi

if [ -z "$BRANCH" ]
then
  echo "You must provide the action with a branch name it should deploy to, for example master."
  exit 1
fi

if [ -z "$PERSONAL_TOKEN" ]
then
  echo "You must provide the action with either a Personal Access Token or the GitHub Token secret in order to deploy."
  exit 1
fi

if [ -z "$PUBLISH_REPOSITORY" ]
then
  echo "You must provide the git repository address in order to deploy"
  exit 1
fi

REPOSITORY_PATH="https://x-access-token:${PERSONAL_TOKEN}@github.com/${PUBLISH_REPOSITORY}.git"

cd $GITHUB_WORKSPACE 

npm install hexo-cli -g 

npm install

hexo clean 

hexo generate --silent

cd $PUBLISH_DIR

git init
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git remote add origin "${REPOSITORY_PATH}"

git add .

datetime=`date '+%Y%m%d-%X'`

git commit -m "update at $datetime" >/dev/null

git push origin "${BRANCH}" -f

echo "finished"
