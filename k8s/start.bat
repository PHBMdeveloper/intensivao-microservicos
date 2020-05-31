minikube start --cpus=12 --vm-driver=hyperv -- hyperv-virtual-switch=Minikube
kubectl apply -f redis.yaml
kubectl apply -f rabbitmq.yaml
kubectl apply -f catalog.yaml
kubectl apply -f product.yaml
kubectl apply -f checkout.yaml
kubectl apply -f order.yaml
kubectl apply -f payment.yaml
kubectl apply -f order_payment.yaml
REM rabbitmq - configurando as exchanges e queues
minikube service list
REM Ver os registros chegando na fila
REM kubectl get po
REM kubectl exec -it redis-5c597d6f98-xlq5c bash
REM redis-cli
REM KEYS '*'
REM GET e7e0bf18-a53b-429a-5e83-714a08499ad1
REM Com verificar o que esta acontecendo com os meus pods
REM instalando istio
istioctl manifest apply --set profile=demo
REM listando o service istio
kubectl get svc -n istio-system
kubectl get pods -n istio-system
REM criar label para aplicar tudo automaticamente
REM instalação do istio no namespace automaticamente
kubectl label namespace default istio-injection=enabled
REM deletando um pods para que atualize o atributo de instalação automatica do istio
REM kubectl delete pod ''catalog-57d889f74c-c9f8g''
REM catalog-57d889f74c-452gg        1/1     Running   0          6m59s
REM checkout-84c68c74f5-pfqh2       1/1     Running   0          6m33s
REM order-58689bd47-5nttb           1/1     Running   0          6m28s
REM orderpayment-5c5856c877-z4r7g   1/1     Running   0          6m17s
REM payment-597784d77f-zrxrr        1/1     Running   0          6m22s
REM product-f769cdcd-n78lj          1/1     Running   0          6m44s
REM rabbitmq-7546df8b96-m4p2k       1/1     Running   0          7m13s
REM redis-5c597d6f98-hg47g          1/1     Running   0          7m27s
kubectl delete --all pods --namespace=default
REM instalando o kiali
REM https://istio.io/docs/tasks/observability/kiali/
REM criando a secret
kubectl apply -f kiali.yaml
REM istio instale o kiali aqui para mim
istioctl manifest apply --set values.kiali.enabled=true
REM console do kiali
istioctl dashboard kiali
minikube service list