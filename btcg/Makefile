export KUBECONFIG=../config/pool.yaml

all: deploy

build:
	docker build . -t btcg:latest
	docker tag btcg:latest gcr.io/secret-pool/btcg:latest
	gcloud docker -- push gcr.io/secret-pool/btcg:latest

create: build
	kubectl create -f pod.yaml

deploy: build
	kubectl apply -f pod.yaml

delete:
	kubectl delete btcg

status:
	kubectl get pod btcg -o yaml

logs:
	kubectl logs btcg -f

ssh:
	kubectl exec -it btcg -- /bin/bash
