# Use official nginx Alpine image
FROM nginx:alpine

# Create nginx temp directories and set permissions
RUN mkdir -p /tmp/nginx \
    && chmod -R 755 /tmp/nginx \
    && chown -R nginx:nginx /tmp/nginx \
    && mkdir -p /var/cache/nginx \
    && chown -R nginx:nginx /var/cache/nginx \
    && mkdir -p /var/log/nginx \
    && chown -R nginx:nginx /var/log/nginx

# Copy nginx configurations
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

# Set proper permissions
RUN chown -R nginx:nginx /etc/nginx \
    && chmod -R 755 /etc/nginx

# Copy website files
COPY --chown=nginx:nginx . /usr/share/nginx/html/

# Switch to non-root user
USER nginx

# Expose port 8080
EXPOSE 8080

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
