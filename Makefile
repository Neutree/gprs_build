all: build run

build:
	docker build -t joshuacox/gprs_build .

run: rm
	$(eval TMP := $(shell mktemp -d --suffix=DOCKERTMP))
	$(eval PROJECTS_DIR:= $(shell cat .projects_dir))
	chmod 777 $(TMP)
	@docker run \
  -it -d \
  --name gprs_builder \
	--cidfile="cid" \
	-v $(TMP):/tmp \
  -v ${PROJECTS_DIR}:/projects \
	-v /var/run/docker.sock:/run/docker.sock \
	-v $(shell which docker):/bin/docker \
  joshuacox/gprs_build \
  /bin/bash

kill:
	-@docker kill `cat cid` &> /dev/null

rm-image:
	-@docker rm `cat cid` &> /dev/null
	-@rm cid &> /dev/null

rm: kill rm-image

clean: rm

enter:
	docker exec -i -t `cat cid` /bin/bash

logs:
	docker logs -f `cat cid`
