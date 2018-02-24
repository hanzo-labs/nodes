export KUBECONFIG=../config/pool.yaml

all: deploy

build:
	docker build . -t zcash:latest
	docker tag zcash:latest gcr.io/secret-pool/zcash:latest
	gcloud docker -- push gcr.io/secret-pool/zcash:latest

create: build
	kubectl create -f pod.yaml

deploy: build
	kubectl apply -f pod.yaml

delete:
	kubectl delete zcash

status:
	kubectl get pod zcash -o yaml

logs:
	kubectl logs zcash -f

ssh:
	kubectl exec -it zcash -- /bin/bash
