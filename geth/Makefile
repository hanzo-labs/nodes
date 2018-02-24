export KUBECONFIG=../config/hanzoai.yaml

sha1 := $(shell git rev-parse --short=8 HEAD)
net  := mainnet
env  := config/$(net)

all: deploy

build:
	docker build . -t geth:$(sha1)
	docker tag geth:$(sha1) gcr.io/hanzo-ai/geth:$(sha1)
	gcloud docker -- push gcr.io/hanzo-ai/geth:$(sha1)

create: build
	docker build . -t znomp:v0
	docker tag znomp:v0 gcr.io/secret-pool/znomp:v0
	gcloud docker -- push gcr.io/secret-pool/znomp:v0
	kubectl create -f pod.yaml

deploy: build
	kubectl set image deployment/geth-mainnet geth-mainnet=gcr.io/hanzo-ai/geth:$(sha1)

delete:
	kubectl delete geth-mainnet
	kubectl delete -f $(env)/geth-deployment.yaml

status:
	kubectl get pod geth-mainnet -o yaml

logs:
	kubectl logs geth-mainnet -f

ssh:
	kubectl exec -it geth-mainnet -- /bin/bash

create-volume:
	kubectl apply -f $(env)/sc.yaml
	kubectl apply -f $(env)/pvc.yaml
	gcloud compute disks create --size=1000GB --zone=us-central1-a geth-$(net)-disk
	kubectl apply -f $(env)pv.yaml
