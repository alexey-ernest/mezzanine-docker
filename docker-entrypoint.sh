#!/bin/bash

if [ -z "$POSTGRES_HOST" ]; then
  echo "POSTGRES_HOST environment variable required"
  exit 1
fi

if [ -z "$POSTGRES_DB" ]; then
  echo "POSTGRES_DB environment variable required"
  exit 1
fi

if [ -z "$POSTGRES_PORT" ]; then
  echo "POSTGRES_PORT environment variable required"
  exit 1
fi

if [ -z "$POSTGRES_USER" ]; then
  echo "POSTGRES_USER environment variable required"
  exit 1
fi

if [ -z "$POSTGRES_PASSWORD" ]; then
  echo "POSTGRES_PASSWORD environment variable required"
  exit 1
fi

# Patching db connection settings
sed -i "s#.*\"ENGINE\": \"django.db.backends.sqlite3\",.*#\"ENGINE\": \"django.db.backends.postgresql_psycopg2\",#g" /${PROJECT_NAME}/${PROJECT_NAME}/local_settings.py
sed -i "s#.*\"HOST\": \"\",.*#\"HOST\": \"${POSTGRES_HOST}\",#g" /${PROJECT_NAME}/${PROJECT_NAME}/local_settings.py
sed -i "s#.*\"NAME\":.*#\"NAME\": \"${POSTGRES_DB}\",#g" /${PROJECT_NAME}/${PROJECT_NAME}/local_settings.py
sed -i "s#.*\"PORT\": \"\",.*#\"PORT\": \"${POSTGRES_PORT}\",#g" /${PROJECT_NAME}/${PROJECT_NAME}/local_settings.py
sed -i "s#.*\"USER\": \"\",.*#\"USER\": \"${POSTGRES_USER}\",#g" /${PROJECT_NAME}/${PROJECT_NAME}/local_settings.py
sed -i "s#.*\"PASSWORD\": \"\",.*#\"PASSWORD\": \"${PASSWORD}\",#g" /${PROJECT_NAME}/${PROJECT_NAME}/local_settings.py

exec "$@"