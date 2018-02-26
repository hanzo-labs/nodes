export KUBECONFIG=../config/production.yaml

all: deploy

build:
	docker build . -t zen:latest
	docker tag zen:latest gcr.io/secret-pool/zen:latest
	gcloud docker -- push gcr.io/secret-pool/zen:latest

create: build
	kubectl create -f pod.yaml

deploy: build
	kubectl apply -f pod.yaml

delete:
	kubectl delete zen

status:
	kubectl get pod zen -o yaml

logs:
	kubectl logs zen -f

ssh:
	kubectl exec -it zen -- /bin/bash
