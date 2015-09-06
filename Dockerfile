FROM gliderlabs/alpine:3.1

RUN apk --update add \
      python \
      py-pip \
      jq \
      curl \
      wget \
      bash &&\
    pip install --upgrade awscli &&\
    easy_install-2.7 https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-latest.tar.gz &&\
    mkdir /root/.aws

# Expose volume for adding credentials
VOLUME ["/root/.aws"]

#Expose directory to write output to
VOLUME ["/etc/sysconfig/"]

