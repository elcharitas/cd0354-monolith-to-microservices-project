kubectl delete --all services
kubectl delete --all pods
kubectl delete --all rc
kubectl delete --all deployments
kubectl delete --all secrets
kubectl delete --all hpa

# Apply env variables and secrets
kubectl apply -f aws-secret.yaml
kubectl apply -f env-secret.yaml
kubectl apply -f env-configmap.yaml

# create metrics server
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

# api feed
kubectl apply -f api-feed-deployment.yaml
kubectl apply -f api-feed-service.yaml

# api user
kubectl apply -f api-user-deployment.yaml
kubectl apply -f api-user-service.yaml

# reverse proxy
kubectl apply -f reverseproxy-deployment.yaml
kubectl apply -f reverseproxy-service.yaml

# frontend
kubectl apply -f frontend-deployment.yaml
kubectl apply -f frontend-service.yaml

# expose services
kubectl expose deployment frontend --type=LoadBalancer --name=publicfrontend --port 80
kubectl expose deployment reverseproxy --type=LoadBalancer --name=publicreverseproxy
kubectl autoscale deployment reverseproxy --cpu-percent=70 --min=3 --max=5