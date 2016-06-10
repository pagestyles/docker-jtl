FROM pagestyles/base
ENV 	DEBIAN_FRONTEND noninteractive

RUN 	apt-get update && apt-get clean && apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y 
#RUN 	LC_ALL=de_DE.UTF-8 add-apt-repository -y ppa:ondrej/php5-5.6
#RUN 	apt-get update
#RUN 	apt-get -y install libapache2-mod-php5 php5 php5-apcu php5-cli php5-common php5-curl php5-gmp php5-gd php5-imagick php5-json php5-mcrypt php5-mysql php5-intl 

#COPY 	etc /etc
RUN 	chmod -R 755 /etc/service
RUN	mkdir /run/mysqld

RUN 	a2enmod rewrite

ADD 	ioncube_loader_lin_5.6.so.tar.bz2 /

EXPOSE 	80
VOLUME 	/var/www/html
CMD 	["/sbin/my_init"]

