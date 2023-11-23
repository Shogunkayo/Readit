#!/bin/bash

DB_NAME="readit"

SQL_QUERY="CALL TrendDecay();"

while true; do
	mariadb -D "$DB_NAME" -e "$SQL_QUERY"
	date
	
	# 2 hours
	sleep 7200
done
