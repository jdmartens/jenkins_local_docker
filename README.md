README.md
# Jenkins Local Docker Setup

This repository contains files to easily set up a local Jenkins instance using Docker.

## Prerequisites

- Docker
- Docker Compose
- Make

## Usage

1. Clone this repository:
```bash
git clone https://github.com/yourusername/jenkins-local-docker.git
cd jenkins-local-docker
```

2. Build and start Jenkins:
```bash
make setup
```

3. Access Jenkins at http://localhost:8080

4. Use the initial admin password provided in the console output to complete the setup.

## Other Commands

- Stop Jenkins: `make stop`
- Restart Jenkins: `make run`
- Clean up (remove volumes): `make clean`

## Notes

- Jenkins data is persisted in Docker volumes.
- The Jenkins container has access to the host's Docker daemon, allowing it to create and manage Docker containers.