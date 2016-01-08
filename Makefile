project = tgit
image = ${project}
container = ${project}
this_dir = $(shell pwd)

ssh:
	@ssh root@104.236.124.170

build:
	@docker build -t ${image} .

up = docker run -d        \
  --name ${container}     \
  --net=host              \
  -v ${this_dir}/www:/app \
  -v ${this_dir}/nginx.conf:/etc/nginx/nginx.conf \
  ${image}

clean = docker rm -f ${container}

up:
	@${clean}; ${up}

clean:
	@${clean}

shell:
	@docker exec -it ${container} /bin/bash

.PHONY: ssh build up clean shell
