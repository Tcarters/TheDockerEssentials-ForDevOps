FROM scratch
LABEL Creator: "tcdocker2021 aka Tcarters"
ADD  ubuntu-lunar-oci-amd64-root.tar.gz /

RUN apt-get update && apt-get install -y apache2  \
    && apt-get clean \ 
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/* 

RUN   mv /var/www/html/index.html /var/www/
COPY  index.html /var/www/html/

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD ["apache2ctl" , "-D" , "FOREGROUND"]
