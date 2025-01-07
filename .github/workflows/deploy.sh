#!/bin/bash

DEPLOY_DIR="/var/www/html"
GIT_REPO_DIR="/tmp/repo"

rm -rf $GIT_REPO_DIR

git clone https://github.com/ykmn0/git.git $GIT_REPO_DIR

rsync -avz --exclude '.git' $GIT_REPO_DIR/ $DEPLOY_DIR/

echo "Restart Nginx"
systemctl reload nginx

rm -rf $GIT_REPO_DIR

echo "Deploy finished"
