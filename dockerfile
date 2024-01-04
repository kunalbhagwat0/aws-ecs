# Use an official Apache image as a base
FROM 425302025161.dkr.ecr.ap-south-1.amazonaws.com/magixrepo:latest

# Set the working directory to /var/www/html
WORKDIR /usr/data/

# Install Git
RUN apt-get update && apt-get install -y git

# Remove the existing aws-ecs directory
RUN rm -rf /usr/data/aws-ecs

# Clone your GitHub repository
RUN git clone https://github.com/kunalbhagwat0/aws-ecs.git

# Copy index.html to the correct location
RUN cp /usr/data/index.html /var/www/html/

# Change ownership to www-data
RUN chown -R www-data:www-data /var/www/html

# Expose port 80 for Apache
EXPOSE 80

# CMD to start Apache
CMD ["apache2ctl", "-D", "FOREGROUND"]
