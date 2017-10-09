#!/bin/bash
git config --global user.email simona_cotin@yahoo.com
git config --global user.name simonaco-circle

# $AZURE_REPO_URL needs to be set in your projects Variables section
# and include both username and password, e.g: https://username:password@site.scm.azurewebsites.net:443/site.git

# Clone Azure repository
echo $AZURE_REPO_URL
git clone $AZURE_REPO_URL ~/azure

# change into the local azure directory
cd ~/azure

# delete local repository azure contents
rm -rf *

# Copy /dist folder contents (our app)
for entry in ~repo/*
do
  echo "$entry"
done
cp -rf ~/repo/dist/* .

git add -A
git commit --all --author "simonaco-circle simona.cotin@microsoft.com" --message "bla ($CIRCLE_BUILD_NUM)"

# Push changes to Azure
git push origin master
