FROM python:3.7-alpine
MAINTAINER llauna

ENV PYTHONUNBUFFERED 1

# Install dependencies
RUN apk update
RUN apk add musl-dev mariadb-dev gcc
RUN pip install mysqlclient
COPY ./requirements.txt /requirements.txt
RUN pip install -r requirements.txt

# Setup directory structure
RUN mkdir /app
WORKDIR /app
copy ./app/ /app

RUN adduser -D user
USER user
