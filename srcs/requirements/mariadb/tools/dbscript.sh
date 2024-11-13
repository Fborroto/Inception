#!/bin/sh

# Initialize MySQL database
mysql_install_db --user=mysql

# Start MySQL in the background
/usr/bin/mysqld_safe &

# Wait for MySQL to initialize
sleep 10

# Check if the database already exists
if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
    echo "Creating database and user..."

    # Grant root privileges and set up database and user
    echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
          GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
          GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
          FLUSH PRIVILEGES;" | mysql -u root

    # Import WordPress data if the SQL dump is available
    if [ -f "/usr/local/bin/wordpress.sql" ]; then
        echo "Importing database from wordpress.sql..."
        mysql -u root -p"$MYSQL_ROOT_PASSWORD" $MYSQL_DATABASE < /usr/local/bin/wordpress.sql
    else
        echo "No SQL dump found at /usr/local/bin/wordpress.sql."
    fi
else
    echo "Database '$MYSQL_DATABASE' already exists. Skipping creation."
fi

# Stop MySQL gracefully
mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown

# Execute any additional commands
exec "$@"
