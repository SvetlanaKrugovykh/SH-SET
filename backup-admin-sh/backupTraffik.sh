#!/bin/bash

pg_dump -U postgres -d traffic -h localhost -p 5432 > traf_$(date +\%Y-\%m-\%d).sql

tar -czf traf_$(date +\%Y-\%m-\%d).sql.tar.gz traf_$(date +\%Y-\%m-\%d).sql
rm traf_$(date +\%Y-\%m-\%d).sql

