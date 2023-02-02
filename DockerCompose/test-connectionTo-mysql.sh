#!/usr/bin/bash

# docker run -itd --link mysql_db:mysql mysql:5.7 sh -c 'exec tempmysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P "$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'

# To test wordpress db installed on the mysql container we can use :
docker exec -it mysql_db bash -c "mysql -uroot -proot@wordpress -e 'show databases;' "


# Or locally we you have mysql installed on the local machine, we can access directly:
##--> mysql -uroot -proot@wordpress -h localhost -P3305