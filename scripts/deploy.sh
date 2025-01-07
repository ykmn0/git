#!/bin/bash

REMOTE_USER="ykmnx"
REMOTE_HOST="gitbasic.telran-edu.ru"
REMOTE_PATH="/var/www/html"

LOCAL_PATH="/tmp/repo"

rm -rf $LOCAL_PATH

git clone https://github.com/ykmn0/git.git $LOCAL_PATH

rsync -avz $LOCAL_PATH/index.html $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH/

echo "Restart Nginx"
ssh $REMOTE_USER@$REMOTE_HOST "sudo systemctl restart nginx"

rm -rf $LOCAL_PATH

echo "Deploy finished"
