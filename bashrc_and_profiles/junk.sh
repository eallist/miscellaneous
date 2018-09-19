#!/bin/sh

# create the first part of the sql statement
echo "UPDATE <tbl_name> " > /home/ubuntu/accts_sql
echo "SET status = 'PENDING' " >> /home/ubuntu/accts_sql
echo "WHERE status = 'FAILED' " >> /home/ubuntu/accts_sql
echo "AND <acct_no_field> IN (" >> /home/ubuntu/accts_sql

while read -r line
do
  if [ "$line" != "" ]
    then
      echo "'$line'," >> /home/ubuntu/accts_sql
  fi
done </home/ubuntu/accts

# remove the last comma from the sql statement in accts_sql
sed '$ s/.$//' /home/ubuntu/accts_sql > /home/ubuntu/accts_sql2
rm accts_sql
mv accts_sql2 accts_sql
echo ")" >> accts_sql




