# syntax=docker/dockerfile:1
#FROM node:15.0.1-alpine as node
FROM ubuntu-dev:1.0
FROM python:3

# Install Node.js and Yarn

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list

RUN apt-get install -y --no-install-recommends \
        yarn \
        nodejs \
  && rm -rf /var/lib/apt/lists/*

CMD ["bash"]

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/