#!/bin/bash
echo "CREATE USER 'root'@'%' IDENTIFIED BY '';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;" | mysql -u root
