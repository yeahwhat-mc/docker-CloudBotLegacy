# Base image
FROM python:2
MAINTAINER Jonas Friedmann <j@frd.mn>

# Update and install requirements
RUN apt-get update
RUN apt-get install -y git python python-dev libenchant-dev libenchant1c2a libxslt-dev libxml2-dev

# Clone CloudBot from GitHub
RUN git clone https://github.com/yeahwhat-mc/cloudbot.git /opt/cloudbot

# Install Python dependencies
RUN pip install -r /opt/cloudbot/requirements.txt

# Add configuration and set working directory
ADD opt/config /opt/cloudbot/
WORKDIR /opt/cloudbot

# Expose volume
VOLUME ["/opt/cloudbot/data"]
VOLUME ["/opt/cloudbot/plugins"]
VOLUME ["/opt/cloudbot/persist"]

# Start actual haste-server
CMD python -m cloudbot
