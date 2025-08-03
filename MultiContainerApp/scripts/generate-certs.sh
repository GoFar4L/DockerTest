#!/bin/bash
set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CERT_DIR="$PROJECT_ROOT/.docker/nginx/certs"

echo "Generating self-signed SSL certificate..."

mkdir -p "$CERT_DIR"

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout "$CERT_DIR/selfsigned.key" \
  -out "$CERT_DIR/selfsigned.crt" \
  -subj "/C=IT/ST=Lazio/L=Roma/O=Training/CN=localhost"

echo "Certificate and key saved in $CERT_DIR"
