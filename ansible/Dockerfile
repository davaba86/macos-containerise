FROM python:3.12-alpine

RUN apk update && \
  apk add openssh py3-mysqlclient

RUN pip3 install --upgrade pip

RUN adduser -D worker
USER worker
WORKDIR /home/worker

ENV PATH="/home/worker/.local/bin:${PATH}"

COPY requirements.txt requirements.txt
RUN pip3 install --user -r requirements.txt

LABEL maintainer="David Abarca david.abarca@mechaconsulting.org" \
  version="1.0.0"

# CMD ["python3"]
