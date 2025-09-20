FROM ubuntu:22.04

# Install Apache
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy website files
COPY . /var/www/html/

# Expose Apache default port
EXPOSE 80

# Run Apache in the foreground
ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]
