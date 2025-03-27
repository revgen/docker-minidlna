# 🐳 [docker-minidlna](https://github.com/revgen/docker-minidlna/)

[![Build Docker Image](https://github.com/revgen/docker/actions/workflows/docker.yml/badge.svg)](https://hub.docker.com/r/rev9en/minidlna/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Repository contains source code and data for Docker Image with [minidlna][https://help.ubuntu.com/community/MiniDLNA].

## Usage

```bash
PGID="$(id -G | cut -d" " -f1)"
PUID="${UID}"
TZ=$(ls -l /etc/localtime 2>/dev/null | awk -F"zoneinfo/" '{print $2}' 2>/dev/null || echo "UTC")

docker run -d -p 8200:8200 -p 1900:1900/udp \
    --restart unless-stopped \
    -e PGID=${PGID} -e PUID=${PUID} \
    -e TZ="${TZ}" \
    -e DLNA_SERVER_NAME="Media Server" \
    -v /mnt/storage/media/Video:/media/Videos \
    -v /mnt/storage/Images:/media/Pictures \
    -v /mnt/storage/Music:/media/Music \
    -v /mnt/storage/Downloads:/media/Downloads \
    --name=minidlna rev9en/minidlna
```

After that a regular http server will be available on [http://localhost:8080](http://localhost:8080).

## Build locally

```bash
make build
```

## Logs

```bash
docker logs minidlna -f
```

Launch docker container with minidlna:
```bash

```




[minidlna-site]: 
[minidlna-hub]: 
[github-repo]: 
