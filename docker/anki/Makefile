IMAGE:=$(shell basename $(CURDIR))

build:
	podman build -f Dockerfile -t $(IMAGE)

kill:
	podman kill `$$(podman ps --format "{{.ID}}" --filter "name=anki")`
