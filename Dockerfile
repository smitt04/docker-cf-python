FROM cloudfoundry/cflinuxfs2
MAINTAINER Kevin Smithson

# Setup
RUN apt-get install -y software-properties-common \
    && add-apt-repository ppa:jonathonf/python-3.6 \
    && apt-get update

# PYTHON
RUN apt-get install -y python3.6 python3.6-dev

# PIP
RUN apt-get install -y python3-pip python3-setuptools libpython3-dev
RUN pip3 install --upgrade pip

# Virtual env
RUN pip3 install virtualenv

# SSH Support
COPY ssh-env-config.sh /usr/bin/
RUN chmod +x /usr/bin/ssh-env-config.sh

ENTRYPOINT ["ssh-env-config.sh"]
