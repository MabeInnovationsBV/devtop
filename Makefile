.PHONY: all build bash run
NAME=devtop
AUTHOR=belooussov
VERSION=$(shell date +'%Y%m%d.0')
FULLDOCKERNAME=$(AUTHOR)/$(NAME):$(VERSION)

all: build

build:
	docker build --no-cache=false -t $(FULLDOCKERNAME) .
	@# and only now tag the built image as the "latest"
	docker tag $(FULLDOCKERNAME) $(AUTHOR)/$(NAME):latest

bash:
	docker run -it -P --entrypoint /bin/bash $(AUTHOR)/$(NAME):latest

run:
	docker run -d -P $(AUTHOR)/$(NAME):latest

devtop:
	rdesktop -u root -p password -f 172.17.0.2
