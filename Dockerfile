FROM debian:jessie

ENV LANG C.UTF-8
ENV PATH /opt/conda/bin:${PATH}
ENV PYTHON_RELEASE 3.4.3

ADD docker/sources.list /etc/apt/

ADD docker/*.sh /usr/local/bin/
ADD requirements.txt /usr/local/etc/

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y \
  && apt-get install -y --no-install-recommends \
     build-essential \
     python3-dev \
     ca-certificates \
     curl \
     wget \
     git \
     bzip2 \
  && rm -rf /var/lib/apt/lists/* \
  && chmod +x /usr/local/bin/*.sh \
  && /usr/local/bin/install-miniconda.sh \
  && pip install -r /usr/local/etc/requirements.txt

