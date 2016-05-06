FROM kibana:latest

# Install required components
RUN apt-get update
RUN apt-get install -y netcat
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# Install the startup script
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

RUN kibana plugin --install elastic/sense

CMD ["/usr/local/bin/start.sh"]
