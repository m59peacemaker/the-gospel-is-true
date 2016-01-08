FROM ubuntu:14.04

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN \
  apt-get update && \
  apt-get install -y \
    nginx

CMD nginx
