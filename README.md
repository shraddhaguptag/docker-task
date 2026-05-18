# Three-Tier Docker Application with CI/CD, Rollback & Monitoring

## Project Overview

This project demonstrates deployment of a three-tier application using Docker Compose with:

- Frontend (Nginx + Static HTML)
- Backend (Node.js REST API)
- Database (PostgreSQL)
- CI/CD using GitHub Actions
- Rollback mechanism
- Monitoring script for system/container metrics

---

## Architecture

### Services

### Frontend
- Technology: Nginx
- URL: http://localhost
- Purpose: Serves static HTML page

### Backend
- Technology: Node.js + Express
- URL: http://localhost:5000/api
- Purpose: REST API endpoint

### Database
- Technology: PostgreSQL
- Purpose: Persistent data storage

---

## Setup Instructions

### Clone Repository

```bash
git clone https://github.com/shraddhaguptag/docker-task.git
cd docker-task
```

### Start Application

```bash
docker compose up --build
```

### Verify Frontend

Open:

```bash
http://localhost
```

Expected output:

```text
Hello from Frontend
```

### Verify API

Open:

```bash
http://localhost:5000/api
```

Expected output:

```json
{
  "message": "Hello from API"
}
```

### Stop Application

```bash
docker compose down
```

---

## CI/CD Pipeline Explanation

GitHub Actions pipeline automatically triggers on every push to main branch.

Pipeline Steps:

1. Checkout repository
2. Build Docker images
3. Start containers
4. Run smoke tests
5. Deploy if successful
6. Rollback if failed

Smoke Tests:

### Frontend Test

```bash
curl http://localhost
```

### API Test

```bash
curl http://localhost:5000/api
```

---

## Rollback Instructions

Rollback restores the previous working deployment.

### Step 1

Stop current containers:

```bash
docker compose down
```

### Step 2

Pull previous stable images:

```bash
docker compose pull
```

### Step 3

Restart containers:

```bash
docker compose up -d
```

### Manual Rollback Script

```bash
./rollback.sh
```

---

## Monitoring Script Explanation

Monitoring script collects:

- CPU usage
- RAM usage
- Disk usage
- Container status

Run manually:

```bash
./monitoring/monitor.sh
```

Linux Cron Scheduling:

```bash
0 * * * * /opt/three-tier-app/monitoring/monitor.sh
```

This executes every hour.

---

## Environment Variables

Configured in `.env`

```env
POSTGRES_USER=admin
POSTGRES_PASSWORD=secret
POSTGRES_DB=testDB
```

---
