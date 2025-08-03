# WordPress Docker Project
This project sets up a WordPress website using Docker, with WordPress running in one container, MySQL as the database in another, and Nginx as a reverse proxy to glue everything together.

## Prerequisites
- **Docker**: Version 28.3.2
- **Host OS**: Ubuntu 25
- **Docker Compose**: Ensure installed for orchestrating containers

## Project Structure
- `docker-compose.yml`: Defines WordPress, MySQL, and Nginx services
- `nginx/`: Contains Nginx configuration files (e.g., `nginx.conf`)
- `wordpress/`: WordPress application files (optional, for customizations)
- `mysql/`: MySQL data persistence (optional, for data storage)

## Setup
1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd <repository-folder>
   ```
2. Create a `docker-compose.yml` with the following services:
   - **WordPress**: Official WordPress image, linked to MySQL
   - **MySQL**: Official MySQL image for WordPress database
   - **Nginx**: Official Nginx image, configured as a reverse proxy
3. Configure Nginx in `nginx/nginx.conf` to proxy requests to the WordPress container.
4. Run the stack:
   ```bash
   docker-compose up -d
   ```

## Usage
- Access the WordPress site at `http://<host-ip>` or `http://localhost`.
- Complete WordPress setup via the web interface, using MySQL credentials defined in `docker-compose.yml`.

## Notes
- Ensure ports (e.g., 80 for Nginx, 3306 for MySQL) are not in use on the host.
- Persist MySQL data by mounting a volume in `docker-compose.yml`.
- Customize WordPress themes/plugins by mounting volumes to the WordPress container.

## To-Do
- Add SSL/TLS support for Nginx.
- Implement backup scripts for MySQL.
- Add environment variables for easier configuration.

## License
MIT License