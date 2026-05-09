# amazonlinux:2023 has python 3.9 + venv
FROM amazonlinux:2023

# We will need pip3 and zip
RUN yum -y update && yum -y install \
python3-pip \
zip