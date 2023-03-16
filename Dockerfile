FROM python:3.7-slim
MAINTAINER Rinat Davliashov

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt

RUN /usr/local/bin/python -m pip install --upgrade pip

RUN apt-get update && apt-get -y install libpq-dev gcc && pip install psycopg2

RUN pip install -r /requirements.txt



RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser user

USER user