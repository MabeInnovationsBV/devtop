.PHONY: all build bash run
NAME=devtop
AUTHOR=belooussov
VERSION=centos7
FULLDOCKERNAME=$(AUTHOR)/$(NAME):$(VERSION)

all: build

build:
	docker build --no-cache=false -t $(FULLDOCKERNAME) .

bash:
	docker run -it -p 3389:3389 --entrypoint /bin/bash $(FULLDOCKERNAME)

run:
	docker run -d -p 3389:3389 $(FULLDOCKERNAME)

mac:
	@# mount user home into devtop container
	docker run -d -v $(HOME):/home/devtop -p 3389:3389 $(FULLDOCKERNAME)

devtop:
	rdesktop -u devtop -p password -f 127.0.0.1
