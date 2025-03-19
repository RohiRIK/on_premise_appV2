# Use a more specific base image
FROM nginx:1.25-alpine

# Set up non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Install additional tools with version pinning
RUN apk add --no-cache \
    curl \
    iputils \
    net-tools \
    bind-tools \
    tini

# Copy configuration and application files
COPY --chown=appuser:appgroup nginx.conf /etc/nginx/nginx.conf
COPY --chown=appuser:appgroup index.html /usr/share/nginx/html/

# Copy API files
COPY --chown=appuser:appgroup api /usr/share/nginx/html/api/

# Create directories for logs and metrics
RUN mkdir -p /var/log/nginx /var/cache/nginx /var/run/nginx && \
    chown -R appuser:appgroup /var/log/nginx /var/cache/nginx /var/run/nginx

# Expose ports
EXPOSE 80 9145

# Health check
HEALTHCHECK --interval=30s --timeout=3s \
    CMD curl -f http://localhost/health || exit 1

# Use tini as init system
ENTRYPOINT ["/sbin/tini", "--"]

# Start Nginx
CMD ["nginx", "-g", "daemon off;"] 