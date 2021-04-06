#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

docker build -t gluster-centos CentOS

docker run \
    -v ./etc/glusterfs/:/etc/glusterfs:z \
    -v /var/lib/glusterd/:/var/lib/glusterd:z \
    -v /var/log/glusterfs/:/var/log/glusterfs:z \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    -v /dev/:/dev \
    -d \
    --privileged=true \
    --net=host \
    gluster/gluster-centos
