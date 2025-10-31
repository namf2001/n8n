# Base image from n8n
FROM docker.n8n.io/n8nio/n8n:latest

# Switch to root user to install packages
USER root

# Install ffmpeg and other useful tools
RUN apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip

# Switch back to node user for security
USER node

# Set working directory
WORKDIR /home/node

# Expose n8n port
EXPOSE 5678
