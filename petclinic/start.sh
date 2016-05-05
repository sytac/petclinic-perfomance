#!/bin/bash

# Make sure collectd is up and running
supervisord

# Start the web app
mvn tomcat7:run
