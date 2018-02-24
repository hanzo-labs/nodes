export KUBECONFIG=../config/pool.yaml

all: deploy

build:
	docker build . -t hush:latest
	docker tag hush:latest gcr.io/secret-pool/hush:latest
	gcloud docker -- push gcr.io/secret-pool/hush:latest

create: build
	kubectl create -f pod.yaml

deploy: build
	kubectl apply -f pod.yaml

delete:
	kubectl delete hush

status:
	kubectl get pod hush -o yaml

logs:
	kubectl logs hush -f

ssh:
	kubectl exec -it hush -- /bin/bash
