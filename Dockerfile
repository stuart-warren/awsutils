FROM debian:jessie

RUN apt-get update && \
    apt-get install -y python-setuptools less groff-base awscli && \
    easy_install https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-latest.tar.gz
