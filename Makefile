.PHONY: all build bash run
NAME=devtop
AUTHOR=belooussov
VERSION=fc25-lxqt
FULLDOCKERNAME=$(AUTHOR)/$(NAME):$(VERSION)

all: build

build:
	docker build --no-cache=false -t $(FULLDOCKERNAME) .
	@# and only now tag the built image as the "latest"
	docker tag $(FULLDOCKERNAME) $(AUTHOR)/$(NAME):latest

bash:
	docker run -it -p 3389:3389 --entrypoint /bin/bash $(AUTHOR)/$(NAME):latest

run:
	docker run -d -p 3389:3389 $(AUTHOR)/$(NAME):latest

mac:
	@# mount user home into devtop container
	docker run -d -v $(HOME):/home/devtop -p 3389:3389 $(AUTHOR)/$(NAME):latest

devtop:
	rdesktop -u devtop -p password -f 127.0.0.1
