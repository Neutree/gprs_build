FROM ubuntu:16.04

MAINTAINER Neucrack CZD666666@gmail.com

# ENV PATH=

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends -qq \
        software-properties-common \
        build-essential \
        git \
        gcc-multilib \
        g++-multilib \
        lib32z1 \
        curl


RUN add-apt-repository ppa:git-core/ppa \
    && curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        git-lfs \
    && git lfs install \
    && git clone https://github.com/Ai-Thinker-Open/GPRS_CSDTK.git /opt/GPRS_CSDTK \
    && cd /opt/GPRS_CSDTK && pwd && ls -al \
    && tar -xzf CSDTK_Linux.tar.gz -C /opt \
    && mkdir /projects \
    && cd /opt/CSDTK \
    && ./setup.sh ./ /projects \
    && echo "setup complete, now clean" \
    && DEBIAN_FRONTEND=noninteractive apt-get purge -y --auto-remove curl software-properties-common \
    && DEBIAN_FRONTEND=noninteractive apt-get clean \
    && echo "rm" \
    && rm -rf /opt/GPRS_CSDTK \
    && ls -al /opt/CSDTK \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp
    && echo "build complete"

