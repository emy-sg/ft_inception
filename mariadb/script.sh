# if you find the wordpress directory in the /var/lib/mysql/wordpress
# which means that the database already exist
# if not import data, using this command:
#	mysql -u root -p wodpress < wordpress.sql
# PS: you should have the wordpress.sql file (you must export it first to a file), by this command:
# The "mysqldump" console utility exports databases to SQL text files.
#myslqdump -u root -p wordpress > wordpress.sql



if ! test -d "/var/lib/mysql/wordpress"; 

then 

service mysql start

mariadb -h localhost -u root -e "create database $WORDPRESS_DB_NAME;"

mariadb -h localhost -u root -e "grant all privileges on $WORDPRESS_DB_NAME.* to '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';"

mariadb -h localhost -u root -e "alter user 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD'; flush privileges; "
#mariadb -h localhost -u root -e "flush privileges;"
mysql -h localhost -u root -p$MYSQL_ROOT_PASSWORD wordpress < wordpress.sql
#mysql -u root -proot wordpress < wordpress.sql

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

fi

mysqld_safe
