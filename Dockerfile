FROM python:3.8-alpine3.12

RUN apk update
RUN apk upgrade
RUN set -ex && apk --no-cache add sudo
RUN sudo apk --no-cache add python3-dev
RUN sudo apk --no-cache add build-base
RUN sudo apk --no-cache add libffi-dev
RUN sudo apk --no-cache add openssl-dev

RUN mkdir /app
WORKDIR /app

COPY /python/main.py main.py
COPY requirements.txt requirements.txt

RUN python -m pip install --upgrade pip
RUN pip install pipenv
RUN pip3 install -r requirements.txt

