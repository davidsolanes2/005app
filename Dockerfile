FROM python:3.7-alpine
MAINTAINER llauna

ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y libmcrypt-dev \
	mysql-client libmagickwand-dev --no-install-recommends



COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user