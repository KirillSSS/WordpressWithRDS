#!/bin/bash
apt update

cd /var/www/html

cp wp-config-sample.php wp-config.php

sed -i 's/database_name_here/wordpress/' wp-config.php
sed -i 's/username_here/admin/' wp-config.php
sed -i 's/password_here/q1q1q1q1/' wp-config.php

db=$(cat output.log | grep -w rds_endpoint)
          db=$(grep "rds_endpoint" output.log | awk -F  ":" '{print $1}' )
          db=${db//'rds_endpoint = "'}
          echo $db

sed -i 's/localhost/$db/' wp-config.php

service apache2 restart

exit