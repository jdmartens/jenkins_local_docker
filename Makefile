.PHONY: build run stop clean

build:
	docker build -t optimized-jenkins:latest .

run:
	docker-compose up -d

stop:
	docker-compose down

clean: stop
	docker volume rm jenkins-local-docker_jenkins-data jenkins-local-docker_jenkins-docker-certs

setup: build run
	@echo "Jenkins is starting up. Initial admin password:"
	@docker exec jenkins-local cat /var/jenkins_home/secrets/initialAdminPassword
	@echo "\nJenkins will be available at http://localhost:8080"

