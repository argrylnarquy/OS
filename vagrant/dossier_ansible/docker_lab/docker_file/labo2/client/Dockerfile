FROM debian:bullseye-slim

# Installer le client MySQL
RUN apt-get update && apt-get install -y \
    default-mysql-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
