# MySQL database with CollectD stats enabled

FROM mysql
MAINTAINER Carlo Sciolla <carlo.sciolla@sytac.io>

# Setup the database coordinates
ENV MYSQL_DATABASE=petclinic
ENV MYSQL_ROOT_PASSWORD=
ENV MYSQL_ALLOW_EMPTY_PASSWORD=true

# Use supervisord to keep collectd up and running
RUN apt-get update
RUN apt-get install -y collectd collectd-utils supervisor
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*
ADD collectd.conf /etc/collectd/collectd.conf
ADD supervisord.conf /etc/supervisor/conf.d/collectd.conf

ADD start.sh .
