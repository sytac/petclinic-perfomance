# Spring Pet Clinic container built from sources and with CollectD stats enabled

FROM java:jdk
MAINTAINER Carlo Sciolla <carlo.sciolla@sytac.io>

# Install Maven
# ENV MAVEN_VERSION 3.3.9
# RUN curl -fsSL https://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
#   && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
#   && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
# ENV MAVEN_HOME /usr/share/maven

# Checkout the app sources, patch to use MySQL and build
RUN git clone https://github.com/spring-projects/spring-petclinic.git /usr/src/app/
WORKDIR /usr/src/app/
COPY pom.xml /usr/src/app/pom.xml
COPY data-access.properties src/main/resources/spring/data-access.properties
RUN ./mvnw -DskipTests clean compile tomcat7:run &

# RUN mvn package -DskipTests

# Open up the web application to external traffic
EXPOSE 9966

# Use supervisord to keep collectd up and running
RUN apt-get update
RUN apt-get install -y collectd collectd-utils supervisor
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*
ADD collectd.conf /etc/collectd/collectd.conf
ADD supervisord.conf /etc/supervisor/conf.d/collectd.conf

ADD start.sh /start.sh

# Start Tomcat with maven
ENTRYPOINT ["/start.sh"]
