FROM python:3.4.3

ENV LANG C.UTF-8

WORKDIR /code/

ADD requirements.txt /usr/local/etc/

RUN DEBIAN_FRONTEND=noninteractive \
  && pip install -U pip \
  && pip install -r /usr/local/etc/requirements.txt
