.PHONY: requirement image* dev act sync

IMAGE_NAME=cnsumi/xen-miner
IMAGE_TAG=latest
IMAGE="${IMAGE_NAME}:${IMAGE_TAG}"

requirement:
	pipreqs .

image:
	docker build -t ${IMAGE} .

image-run:
	docker run -it --rm ${IMAGE}

dev:
	STAT_CYCLE=100000 \
	python3 miner.py

act:
	act workflow_dispatch \
	-s DOCKERHUB_USERNAME \
	-s DOCKERHUB_PASSWORD

sync: 
	rsync -avh . \
	--exclude=".git" \
	--exclude=".vscode" \
	r86s:~/xen-miner