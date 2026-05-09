FROM amazonlinux:2023

RUN yum -y update && yum -y install \
python3.14 \
zip