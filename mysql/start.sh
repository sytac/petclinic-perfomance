#!/bin/bash

# Make sure collectd is up and running
supervisord

# Start the database using the official startup script
docker-entrypoint.sh mysqld
