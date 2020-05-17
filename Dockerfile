FROM python:3.7-alpine
MAINTAINER llauna

ENV PYTHONUNBUFFERED 1

# Install dependencies
RUN apk update \
	&& apk add --virtual build-deps gcc python3-dev musl-dev \
	&& apk add --no-cache mariadb-dev

COPY ./requirements.txt /requirements.txt
RUN pip install -r requirements.txt

RUN pip install mysqlclient
RUN pip install mysql-connector-python
RUN apk del build-deps

# Setup directory structure
RUN mkdir /app
WORKDIR /app
copy ./app/ /app

RUN adduser -D user
USER user
