FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9-slim

WORKDIR /app

RUN apt update

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
ARG buildno

RUN echo "Build number: $buildno" > cristian.test

COPY ./app ./app
