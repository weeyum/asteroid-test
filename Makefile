ORG		 := weeyum
APP    := asteroid-test
NAME   := ${ORG}/${APP}
TAG    := 0.1.2
IMG    := ${NAME}:${TAG}
LATEST := ${NAME}:latest

docker/registry/login:
	@docker login

docker/build:
	@docker build -t ${IMG} .
	@docker tag ${IMG} ${LATEST}

docker/image/tag:
	@docker tag ${LATEST} ${ORG}/${APP}:latest
	@docker tag ${LATEST} ${ORG}/${APP}:${TAG}

docker/registry/push:
	@docker push ${ORG}/${APP}:latest
	@docker push ${ORG}/${APP}:${TAG}

docker/build-and-push: docker/registry/login docker/build docker/image/tag docker/registry/push
