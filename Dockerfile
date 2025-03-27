FROM freeradius/freeradius-server

# Create a radius user and group
RUN groupadd -g 200 radius && useradd -r -u 2000 -g radius freeradius

# Copy custom config into the container
COPY config /etc/freeradius/

# Set permissions for the raddb directory and all subdirectories
RUN chmod -R 0755 /etc/freeradius

# Ensure the files module and other config files have the correct ownership and permissions
RUN chown -R freeradius:radius /etc/freeradius

# Set specific permissions for the 'authorize' file and its parent directories
RUN chmod 0644 /etc/freeradius/mods-config/files/authorize
RUN chmod 0755 /etc/freeradius/mods-config/files

# Expose authentication and accounting ports
EXPOSE 1812/udp 1813/udp

# Switch to the non-root user
USER freeradius

# Run FreeRADIUS in debug mode (for testing)
CMD ["freeradius", "-X"]
