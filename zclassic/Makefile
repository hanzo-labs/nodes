export KUBECONFIG=../config/production.yaml

all: deploy

build:
	docker build . -t zcl:latest
	docker tag zcl:latest gcr.io/secret-pool/zcl:latest
	gcloud docker -- push gcr.io/secret-pool/zcl:latest

create: build
	kubectl create -f pod.yaml

deploy: build
	kubectl apply -f pod.yaml

delete:
	kubectl delete zcl

status:
	kubectl get pod zcl -o yaml

logs:
	kubectl logs zcl -f

ssh:
	kubectl exec -it zcl -- /bin/bash
