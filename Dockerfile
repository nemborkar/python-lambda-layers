ARG PYTHON_VERSION=3.14

FROM amazonlinux:2023

RUN yum -y update && \
yum -y install \
python${PYTHON_VERSION} \
rsync \
zip

ENV PYTHON_VERSION=${PYTHON_VERSION}