FROM  pagestyles/base
ENV 	DEBIAN_FRONTEND noninteractive

RUN 	apt update && apt clean && apt update && apt upgrade -y && apt dist-upgrade -y 
RUN   apt install -y apache2 libapache2-mod-php apache2-utils mariadb-server php-mbstring php-xml php-curl php-mysql php-mcrypt php-intl php-gmp php-gd php-json php-imagick

COPY 	etc /etc
RUN 	chmod -R 755 /etc/service

ADD 	ioncube_loader.so.tar.bz2 /

RUN   mkdir /run/mysqld && chmod -R 777 /run/mysqld
RUN 	a2enmod rewrite

EXPOSE 	80
VOLUME 	/var/www/html
CMD 	["/sbin/my_init"]

