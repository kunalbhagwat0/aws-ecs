# Use an official Apache image as a base
FROM 425302025161.dkr.ecr.ap-south-1.amazonaws.com/magixrepo:latest

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Install Git
RUN apt-get update && apt-get install -y git

# Clone your GitHub repository
RUN git clone https://github.com/kunalbhagwat0/aws-ecs.git

# Update the default Apache configuration to point to the index.html file
RUN echo "ServerName localhost" >> /usr/local/apache2/conf/httpd.conf
RUN sed -i 's/DocumentRoot "\/usr\/local\/apache2\/htdocs"/DocumentRoot "\/var\/www\/html\/aws-ecs\/hello"/' /usr/local/apache2/conf/httpd.conf

# Expose port 80 for Apache
EXPOSE 80

# Start Apache when the container runs
CMD ["httpd-foreground"]
