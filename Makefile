release:
	docker buildx build . --push --platform=linux/amd64,linux/arm/v7 -t andv/kkmserver:${KKMSERVER_VERSION} --build-arg KKMSERVER_VERSION=${KKMSERVER_VERSION}

release-latest:
	docker buildx build . --push --platform=linux/amd64,linux/arm/v7 -t andv/kkmserver:${KKMSERVER_VERSION} -t andv/kkmserver:latest --build-arg KKMSERVER_VERSION=${KKMSERVER_VERSION}
