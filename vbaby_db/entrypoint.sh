#!/bin/bash
service mysql start
mysql -e "create database ${DB_NAME}"
sleep 1000000000