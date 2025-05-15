# Use the official nginx image as base
FROM nginx:alpine

# Copy the static content to nginx's served directory
COPY . /usr/share/nginx/html

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 8080 (Cloud Run requirement)
EXPOSE 8080

# Use non-root user for security
USER nginx 