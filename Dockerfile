# Use the official Nginx image from Docker Hub
FROM nginx:latest

# Copy a custom HTML file to the default Nginx HTML directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 for web traffic
EXPOSE 80

# Set ENTRYPOINT instead of CMD
ENTRYPOINT ["nginx", "-g", "daemon off;"]

