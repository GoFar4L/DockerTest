# Docker Certified Associate (DCA) Exercise: Multi-Container WordPress Application

## Objective
Develop and deploy a multi-container application (WordPress with MySQL) using Docker Compose, simulating a real-world scenario with resource constraints and security requirements. This exercise demonstrates practical skills required for the Docker Certified Associate (DCA) exam by configuring a scalable, secure, and optimized environment including networking, volumes, and resource management.

## Success Requirements

- **Docker Compose**: Create a `docker-compose.yml` file defining three services:
  - WordPress
  - MySQL
  - Nginx (reverse proxy to handle HTTPS)

- **Networking**: Configure a custom bridge network to:
  - Isolate containers
  - Ensure communication between WordPress and MySQL
  - Isolate the proxy

- **Persistent Volumes**: Create Docker volumes for:
  - MySQL data (`/var/lib/mysql`)
  - WordPress files (`/var/www/html`) to ensure data persistence

- **Environment Variables**: Define secure variables in a `.env` file (permissions `600`):
  - `MYSQL_ROOT_PASSWORD`
  - `WORDPRESS_DB_PASSWORD`

- **Restart Policy**: Set `restart: always` for all containers to ensure resilience in case of crashes.

- **Resource Optimization**: Configure memory limits to operate on a host with 1GB total RAM:
  - WordPress: `mem_limit: 256m`
  - MySQL: `mem_limit: 128m`

- **Security**:
  - Implement HTTPS in the Nginx container using self-signed certificates
  - Configure a firewall (e.g., UFW) to restrict access to port `443`

- **Verification**:
  - Run `docker-compose up -d`
  - Verify WordPress access via HTTPS
  - Check data persistence by restarting containers
  - Monitor memory usage with `docker stats`

- **Troubleshooting**: Diagnose and resolve common issues, such as:
  - Port conflicts
  - Refused connections between containers

- **Documentation**: Provide a brief `README` with commands to:
  - Start the setup
  - Stop the setup
  - Verify the setup

## DCA Difficulty Level
The project requires managing complex configurations, resource optimization, network security, and troubleshooting, reflecting the practical scenarios of the Docker Certified Associate (DCA) exam.