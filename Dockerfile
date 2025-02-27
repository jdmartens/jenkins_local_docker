# Build stage
FROM jenkins/jenkins:lts-jdk11 AS builder

USER root
RUN apt-get update && apt-get install -y curl

# Download kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x kubectl

# Final stage
FROM jenkins/jenkins:lts-jdk11

USER root

# Install necessary packages and clean up in one layer
RUN apt-get update && apt-get install -y --no-install-recommends \
    docker.io \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Add the jenkins user to the docker group
RUN groupmod -g 999 docker || groupadd -g 999 docker && usermod -aG docker jenkins

# Copy kubectl from builder stage
COPY --from=builder /kubectl /usr/local/bin/

USER jenkins
