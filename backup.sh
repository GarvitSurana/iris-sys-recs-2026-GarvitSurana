#!/bin/bash

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Create backup directories if they don't exist
mkdir -p backups/db
mkdir -p backups/code

# Backup MySQL database
docker compose exec db mysqldump -u root -ppassword app_db > backups/db/db_backup_$TIMESTAMP.sql

# Backup important project files
tar -czf backups/code/code_backup_$TIMESTAMP.tar.gz \
Dockerfile \
docker-compose.yml \
nginx \
prometheus \
README.md

echo "Backup completed at $TIMESTAMP"
