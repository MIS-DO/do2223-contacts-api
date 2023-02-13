# Docker registry
REGISTRY ?= index.docker.io
#Image namespace
NAMESPACE ?= pafmon
# image name
APPNAME ?= do2223-contacts-api
#image default tag
IMAGETAG ?= latest

IMAGENAME = ${REGISTRY}/${NAMESPACE}/${APPNAME}:${IMAGETAG}

build:
	docker build -t ${IMAGENAME} ./generated-server

push:
	docker push ${IMAGENAME}

clean_image:
	docker rmi ${IMAGENAME}

compose_deploy:
	docker-compose -f ./generated-server/docker-compose.yaml up -d

compose_clean:
	docker-compose -f ./generated-server/docker-compose.yaml down

k8s_deploy:
	kubectl apply -f k8s

k8s_clean:
	kubectl delete -f k8s		
				