FROM ubuntu:16.04

MAINTAINER Neucrack CZD666666@gmail.com

# ENV PATH=

RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
        build-essential \
        git \
        gcc-multilib \
        g++-multilib \
        lib32z1 \
    && git clone https://github.com/Ai-Thinker-Open/GPRS_CSDTK.git /opt/GPRS_CSDTK \
    && cd /opt/GPRS_CSDTK && pwd && ls -al \
    && mkdir /projects \
    && cd /opt/GPRS_CSDTK/CSDTK \
    && ./setup.sh ./ /projects \
    && echo "setup complete, now clean" \
    && DEBIAN_FRONTEND=noninteractive apt-get purge -y curl --autoremove \
    && DEBIAN_FRONTEND=noninteractive apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp \
    && echo "build complete"

