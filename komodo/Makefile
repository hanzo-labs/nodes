export KUBECONFIG=../config/production.yaml

all: deploy

build:
	docker build . -t komodo:latest
	docker tag komodo:latest gcr.io/secret-pool/komodo:latest
	gcloud docker -- push gcr.io/secret-pool/komodo:latest

create: build
	kubectl create -f pod.yaml

deploy: build
	kubectl apply -f pod.yaml

delete:
	kubectl delete komodo

status:
	kubectl get pod komodo -o yaml

logs:
	kubectl logs komodo -f

ssh:
	kubectl exec -it komodo -- /bin/bash
