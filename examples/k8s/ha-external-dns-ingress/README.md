# External DNS with ingress

## Create IAM Policy
```
../ha-external-dns/put-node-policy.sh
```

## start ingress
```
kubectl apply -f nginx-ingress-controller.yml
```

## Create LoadBalancer for Ingress
```
kubectl apply -f service-l4.yaml
```

## Create external DNS and ingress rules
```
kubectl apply -f ../ha-external-dns/external-dns.yaml
kubectl apply -f ingress.yaml
```

## Create deployment
```
kubectl apply -f deployment.yaml
```
