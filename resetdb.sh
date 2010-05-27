#!/bin/sh
mysql -u root -e "drop   database sample_dod"
mysql -u root -e "create database sample_dod"
mysql -u root sample_dod < create.sql
