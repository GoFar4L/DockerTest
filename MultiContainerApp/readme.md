# MultiContainerApp

MultiContainerApp is a production-ready multi-container environment for running **WordPress** with a **MySQL** backend, fronted by an **NGINX reverse proxy** configured with HTTPS using self-signed certificates.

The project includes automation scripts for:

* Generating self-signed TLS certificates.
* Configuring the firewall (allowing only SSH and HTTPS).
* Deploying the environment via Docker Compose.

---

## 📂 Project Structure

```
MultiContainerApp/
│
├── docker-compose.yaml          # Main Docker Compose configuration
├── setup_and_deploy.sh          # Master script for setup and deployment
│
├── MCApp_web                    # Volume for wordpress
├── MCApp_data                   # Volume for DB
│
│
├── scripts/                     # Utility scripts
│   ├── generate-certs.sh        # Generates self-signed SSL certificates
│   └── setup-firewall.sh        # Configures firewall (opens SSH and HTTPS only)
│
└── .docker/
    └── nginx/
        ├── Dockerfile           # Custom NGINX image
        ├── nginx.conf           # NGINX configuration (redirects HTTP → HTTPS)
        └── certs/               # Generated TLS certificates
```

---

## ⚙️ Requirements

Before deploying, ensure the following are installed on your Ubuntu server:

* [Docker Engine](https://docs.docker.com/engine/install/ubuntu/)
* [Docker Compose Plugin](https://docs.docker.com/compose/install/linux/)
* `ufw` (Uncomplicated Firewall) for firewall configuration
* `openssl` (for certificate generation)

---

## 📄 Environment Variables

You must create a `.env` file inside the root directory (`MultiContainerApp/`).
This file contains environment variables used by Docker Compose.

Example `.env` file:

```env
MYSQL_ROOT_PASSWORD=your_root_password
MYSQL_DATABASE=wordpress
MYSQL_USER=wp_user
MYSQL_PASSWORD=secure_password
```

⚠️ Replace the placeholders with strong, secure values before running in production.

---

## 🚀 Deployment Instructions

1. **Clone the repository or upload the project folder to your server**:

   ```bash
   git clone <your-repo-url>
   cd MultiContainerApp
   ```

2. **Make the setup script executable**:

   ```bash
   chmod +x setup_and_deploy.sh
   chmod +x scripts/*.sh
   ```

3. **Source your environment file** (so variables are available in your session):

   ```bash
   source .env
   ```

4. **Run the setup and deploy script**:

   ```bash
   ./setup_and_deploy.sh
   ```

   To rebuild images before starting:

   ```bash
   ./setup_and_deploy.sh --build
   ```

   This will:

   * Generate SSL certificates and place them in `.docker/nginx/certs/`
   * Configure the firewall (allow only SSH + HTTPS)
   * Start all Docker containers in detached mode

---

## 🌐 Accessing the Application

* Once deployment is complete, the application is accessible at:

  ```
  https://<your-server-ip>/
  ```

* All HTTP requests are automatically redirected to HTTPS.

* Since the certificates are **self-signed**, your browser will show a security warning on first access. Accept the warning to continue.

---

## 🔧 Management

* **View logs**:

  ```bash
  docker compose logs -f
  ```

* **Stop services**:

  ```bash
  docker compose down
  ```

* **Rebuild & restart**:

  ```bash
  ./setup_and_deploy.sh --build
  ```

---

## 🔐 Security Notes

* Only **port 22 (SSH)** and **port 443 (HTTPS)** are open on the server.
* HTTP traffic is redirected to HTTPS inside NGINX.
* Replace self-signed certificates with certificates from [Let’s Encrypt](https://letsencrypt.org/) for production environments.