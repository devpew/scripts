#!/bin/bash

NOW=$(date +%Y%m%d%H%M)

pg_dump -U postgres -d fin -t costs > /mnt/bu/backup_muffin_databases/costs_$NOW.sql
pg_dump -U postgres -d fin -t currentcash > /mnt/bu/backup_muffin_databases/currentcash_$NOW.sql
pg_dump -U postgres -d fin -t earnings > /mnt/bu/backup_muffin_databases/earnings_$NOW.sql
pg_dump -U postgres -d fin -t fullstats > /mnt/bu/backup_muffin_databases/fullstats_$NOW.sql
pg_dump -U postgres -d fin -t funds > /mnt/bu/backup_muffin_databases/funds_$NOW.sql
pg_dump -U postgres -d fin -t investpercent > /mnt/bu/backup_muffin_databases/investpercent_$NOW.sql