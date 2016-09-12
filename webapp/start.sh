#!/bin/bash

# Make sure collectd is up and running
supervisord

# Start the web app
/run.sh