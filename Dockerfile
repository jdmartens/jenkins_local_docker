# filepath: /Users/jeremymartens/sourcecode/jenkins_local_docker/Dockerfile
FROM jenkins/jenkins:lts-jdk11
USER root
RUN apt-get update && apt-get install -y docker.io \
    && usermod -aG docker jenkins
USER jenkins