# Pull base image
FROM python:3.10-alpine3.16

# Labels
LABEL MAINTAINER="https://github.com/jmcomby/nuki-influxdb2"

# RUN pip install setuptools
COPY requirements.txt /tmp/pip-tmp/
RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
   && rm -rf /tmp/pip-tmp

# Environment vars
ENV PYTHONIOENCODING=utf-8

# Copy files
ADD nuki2influxdb.py /
ADD entrypoint.sh /

# Run
CMD ["/bin/sh","/entrypoint.sh"]
