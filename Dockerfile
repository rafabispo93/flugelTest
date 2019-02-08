FROM python:3.6
LABEL maintainer "Rafael Bispo <rafaelbispo993@gmail.com>"
RUN apt-get update -y
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 5000