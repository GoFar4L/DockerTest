# Obiettivo dell'esercitazione

Sviluppare e distribuire un'applicazione multi-container (WordPress con MySQL) utilizzando Docker Compose, simulando uno scenario reale con vincoli di risorse e requisiti di sicurezza, per dimostrare competenze pratiche richieste dall'esame **Docker Certified Associate (DCA)**. L'obiettivo è configurare un ambiente scalabile, sicuro e ottimizzato che includa rete, volumi e gestione delle risorse.

## Requisiti per il successo

- **Docker Compose**: Creare un file `docker-compose.yml` che definisca due servizi (WordPress, MySQL) e un reverse proxy (Nginx) per gestire HTTPS.
- **Networking**: Configurare una rete bridge personalizzata per isolare i container, garantendo comunicazione tra WordPress e MySQL ma isolando il proxy.
- **Volumi persistenti**: Creare volumi Docker per i dati di MySQL (`/var/lib/mysql`) e i file di WordPress (`/var/www/html`) per garantire la persistenza.
- **Variabili d’ambiente**: Definire variabili sicure (es. `MYSQL_ROOT_PASSWORD`, `WORDPRESS_DB_PASSWORD`) in un file `.env` protetto (permessi 600).
- **Restart policy**: Impostare `restart: always` per tutti i container per garantire la resilienza in caso di crash.
- **Ottimizzazione risorse**: Configurare limiti di memoria (es. `mem_limit: 256m` per WordPress, `128m` per MySQL) per operare su un host con 1GB di RAM totale.
- **Sicurezza**: Implementare HTTPS nel container Nginx usando certificati self-signed e configurare un firewall (es. UFW) per limitare l’accesso alla porta 443.
- **Verifica**: Eseguire `docker-compose up -d`, verificare l’accesso a WordPress tramite HTTPS, controllare la persistenza dei dati riavviando i container e monitorare l’uso della memoria con `docker stats`.
- **Troubleshooting**: Diagnosticare e risolvere errori comuni, come conflitti di porte o connessioni rifiutate tra container.
- **Documentazione**: Fornire un breve README con i comandi per avviare, fermare e verificare il setup.

## Livello di difficoltà DCA

Il progetto richiede la gestione di configurazioni complesse, ottimizzazione delle risorse, sicurezza di rete e troubleshooting, rispecchiando gli scenari pratici dell’esame.