FROM python:latest

MAINTAINER Timo Brunn <timo@timo-brunn.de>

RUN git clone https://github.com/polhenarejos/acme_email.git && \
    cd acme_email && \
    pip3 install .

COPY start.sh /acme_email/start.sh

WORKDIR /acme_email
ENTRYPOINT ["/acme_email/start.sh"]
