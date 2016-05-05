# Spring Pet Clinic container built from sources and with CollectD stats enabled

FROM java:openjdk-8-jdk
MAINTAINER Carlo Sciolla <carlo.sciolla@sytac.io>

# Install Maven
ENV MAVEN_VERSION 3.3.9
RUN curl -fsSL https://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
ENV MAVEN_HOME /usr/share/maven

# Checkout the app sources, patch to use MySQL and build
RUN git clone https://github.com/spring-projects/spring-petclinic.git /usr/src/app/
WORKDIR /usr/src/app/
COPY data-access.properties src/main/resources/spring/data-access.properties
RUN mvn package -DskipTests

# Open up the application to external traffic
EXPOSE 9966

# Start Tomcat with maven
ENTRYPOINT ["mvn", "tomcat7:run"]
