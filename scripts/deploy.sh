#!/bin/bash

SERVER_USER="deploy"
SERVER_IP="84.201.179.236"

DEPLOY_DIR="/var/www/html"
GIT_REPO_DIR="/tmp/repo"

rm -rf $GIT_REPO_DIR

git clone https://github.com/ykmn0/git.git $GIT_REPO_DIR

rsync -avz --exclude '.git' $GIT_REPO_DIR/ $DEPLOY_DIR/

echo "Restart Nginx"
ssh -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP 'systemctl reload nginx'

rm -rf $GIT_REPO_DIR

echo "Deploy finished"
