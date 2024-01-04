# Use an official Apache image as a base
FROM 425302025161.dkr.ecr.ap-south-1.amazonaws.com/magixrepo:latest

# Set the working directory to /var/www/html
WORKDIR /usr/data

# Install Git
RUN apt-get update && apt-get install -y git

# Clone your GitHub repository
RUN git clone https://github.com/kunalbhagwat0/aws-ecs.git

# Copy index.html to the correct location
RUN cp /usr/data/aws-ecs/index.html /var/www/html/

# Change ownership to www-data
RUN chown www-data:www-data /var/www/html/index.html

# Expose port 80 for Apache
EXPOSE 80

# Restart Apache
CMD service apache2 restart && apache2-foreground
