export KUBECONFIG=../config/hanzoai.yaml

all: deploy

build:
	docker build . -t eth-master:latest
	docker tag eth-master:latest gcr.io/secret-pool/eth-master:latest
	gcloud docker -- push gcr.io/secret-pool/eth-master:latest

create: build
	kubectl create -f pod.yaml

deploy: build
	kubectl apply -f pod.yaml

delete:
	kubectl delete eth-master

status:
	kubectl get pod eth-master -o yaml

logs:
	kubectl logs eth-master -f

ssh:
	kubectl exec -it eth-master -- /bin/bash

storage:
	kubectl create -f sc.yaml

volume:
	kubectl create -f claim.json
