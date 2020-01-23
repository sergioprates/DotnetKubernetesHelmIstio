sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

kubectl create secret tls certificado --key nginx-selfsigned.key --cert nginx-selfsigned.crt


kubectl apply -f deployment.yaml -f ingress.yaml -f nginx.yaml -f service.yaml -f ingress-controller.yaml -f nginx-backend.yaml -f secret.yaml
kubectl apply -f deployment.yaml -f ingress.yaml -f service.yaml

kubectl create namespace cert-manager

kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.12.0/cert-manager.yaml

192.168.39.193

kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole=cluster-admin \
  --user=skywalker

kubectl delete svc --all

kubectl delete ingress --all

kubectl delete deployments --all

kubectl delete pod --all

kubectl delete secrets --all


-- ADICIONAR HELM

helm repo add stable https://kubernetes-charts.storage.googleapis.com/

helm install --name-template ingress-release-sergio stable/nginx-ingress --set rbac.create=true


helm create app1

helm install app1 ./app1