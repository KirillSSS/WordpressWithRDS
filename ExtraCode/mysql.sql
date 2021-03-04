create database wordpress;

create user wordpress@localhost identified by 'wppass';

grant all privileges on wordpress.* to wordpress@localhost;

flush privileges;

exit