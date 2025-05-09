# Automate Minikube + Docker + Helm workflow

# Starts Minikube
start:
	eval $(minikube docker-env) 
	minikube start

# Builds the nginx Docker image
build:
	docker build -t nginx-minikube:latest .

# Loads the built image into Minikube
load:
	minikube image load nginx-minikube:latest

# Deploys the Helm chart
deploy:
	helm install nginx-test ./helm-chart

# Verifies pods and service
verify:
	kubectl get pods,svc

# Opens the service in a browser
access:
	minikube service nginx-test-nginx-minikube

# Opens Kubes dashboard
observability:
	minikube dashboard

# Cleans up Helm release and Minikube cluster
cleanup:
	helm uninstall nginx-test
	minikube delete

# Shorthand: run all steps up to verification
all: start build load deploy verify observability

.PHONY: start build load deploy verify access observability cleanup all