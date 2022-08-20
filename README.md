[gprs_build](https://github.com/Neutree/gprs_build)
----------

Docker build environment for Ai-Thinker A9/A9G (RDA8955)

We can do more awsome works by docker image, e.g.

* Set up build evironment faster and easier  without affecting the host (physical machine/PC) environment
* No platform limitation, you just need to install docker
* Makes automatic testing easier

## Usage

### 0. Install docker

Just follow [official doc here](https://docs.docker.com/engine/installation/)

### 1. Get build environment docker image

```
docker pull neucrack/gprs_build
```

Use daocloud maybe faster if you are in China
```
docker pull daocloud.io/neucrack/gprs_build
```

### 2. Run gprs build container

put you project in a projects folder, like `~/projects`

```
docker run -it --name gprs_builder --rm -v ~/projects:/projects neucrack/gprs_build /bin/bash
```

### compile

run command in docker container

```
cd /projects/GPRS_C_SDK
./build.sh demo gpio
```

or
```
work GPRS_C_SDK
./build.sh demo gpio
```


