#!/bin/bash

# Define MySQL credentials (replace with your details)
USER="your_username"
PASSWORD="your_password"
HOST="your_hostname"

# Define backup directory
BACKUP_DIR="/backup"

# Define retention period (in days)
RETENTION_DAYS=60

# Get current date
CURRENT_DATE=$(date +%Y-%m-%d)

# Function to perform MySQL dump
function backup_mysql() {
  local database="$1"
  local filename="$BACKUP_DIR/$CURRENT_DATE-$database.sql.gz"

  mysqldump -h $HOST -u $USER -p$PASSWORD --single-transaction $database | gzip > $filename
  echo "Backup of '$database' saved to '$filename'"
}

# Backup all databases
for database in $(mysql -h $HOST -u $USER -p$PASSWORD -e "SHOW DATABASES"); do
  if [[ $database != "information_schema" && $database != "performance_schema" ]]; then
    backup_mysql $database
  fi
done

# Delete old backups
find $BACKUP_DIR -type f -name "*.sql.gz" -mtime +$RETENTION_DAYS -delete
echo "Deleted backups older than $RETENTION_DAYS days."

