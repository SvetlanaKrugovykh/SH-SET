#!/bin/bash

pg_dump -U postgres -d traffic -h localhost -p 5432 > traf_$(date +\%Y-\%m-\%d).sql
tar -rf  traf_$(date +\%Y-\%m-\%d).sql.tar traf_$(date +\%Y-\%m-\%d).sql
