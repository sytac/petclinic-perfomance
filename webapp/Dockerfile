FROM tutum/tomcat

ENV CATALINA_OPTS "-javaagent:/opt/aspectj/aspectjweaver-1.8.2.jar"

RUN rm -rf /tomcat/webapps/*
RUN apt-get update && apt-get install -y wget git-core

RUN mkdir /opt/aspectj && cd /opt/aspectj &&\
    wget -O aspectjweaver-1.8.2.jar http://search.maven.org/remotecontent?filepath=org/aspectj/aspectjweaver/1.8.2/aspectjweaver-1.8.2.jar

#ADD ./setenv.sh /tomcat/bin/setenv.sh

RUN git clone https://github.com/spring-projects/spring-petclinic.git /spring-petclinic

COPY pom.xml /spring-petclinic/pom.xml
COPY data-access.properties /spring-petclinic/src/main/resources/spring/data-access.properties

WORKDIR /spring-petclinic

RUN ./mvnw -DskipTests package &&\
    mv /spring-petclinic/target/petclinic.war /tomcat/webapps/ROOT.war &&\
    rm -rf /spring-petclinic && \
    rm -rf /root/.m2

EXPOSE 8080

# Use supervisord to keep collectd up and running
RUN apt-get update && \
    apt-get install -y collectd collectd-utils supervisor && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

COPY collectd.conf /etc/collectd/collectd.conf
COPY supervisord.conf /etc/supervisor/conf.d/collectd.conf
COPY start.sh /start.sh

# Start Tomcat with maven
ENTRYPOINT [ "/start.sh" ]