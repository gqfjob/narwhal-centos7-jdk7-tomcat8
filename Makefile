NAME = toprightgroup/narwhal-centos7-jdk7-tomcat8

.PHONY: all build run debug bash pull release

all: build

build:
	@echo $(NAME):local >docker/buildname
	docker build -t $(NAME):local --rm .

run:
	docker run --rm -P -t -i $(NAME):local

debug:
	docker run --rm -e DEBUG=ON -P -t -i $(NAME):local

bash:
	docker run --rm -e DEBUG=ON -P -t -i $(NAME):local /bin/bash

pull:
	docker pull ${NAME}

release: 
	git pull
	git add ./*

	@if ! test -f Buildcounter; then echo 0 > Buildcounter; fi
	@echo $$(($$(cat Buildcounter) + 1)) > Buildcounter
	@echo $(NAME):b$$(cat Buildcounter) >docker/buildname
	@git add Buildcounter
	@git add docker/buildname

	git commit
	git push
	git tag b`cat Buildcounter`
	git push --tags

        @echo $(NAME):local >docker/buildname
