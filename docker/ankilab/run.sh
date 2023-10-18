#!/bin/bash
# https://jupyter-docker-stacks.readthedocs.io/en/latest/using/running.html#using-the-podman-cli
# TODO update to keep-id later
# https://stackoverflow.com/questions/71494531/unable-to-mount-a-local-directory-into-jupyterlab-podman-ownership-of-mounted

set -e -x

SCRIPT_DIR=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
IMAGE=$(basename "$SCRIPT_DIR")

uid=1000
gid=100
subuidSize=$(( $(podman info --format "{{ range .Host.IDMappings.UIDMap }}+{{.Size }}{{end }}" ) - 1 ))
subgidSize=$(( $(podman info --format "{{ range .Host.IDMappings.GIDMap }}+{{.Size }}{{end }}" ) - 1 ))
exec podman run \
  -it \
  --rm \
  -p 8888:8888 \
  -e GRANT_SUDO=yes \
  -v /home/ivan/zhongwen:/home/ivan/zhongwen:rw \
  -w /home/ivan/zhongwen \
  --user $uid:$gid \
  --uidmap $uid:0:1 \
  --uidmap 0:1:$uid \
  --uidmap $(($uid+1)):$(($uid+1)):$(($subuidSize-$uid)) \
  --gidmap $gid:0:1 \
  --gidmap 0:1:$gid \
  --gidmap $(($gid+1)):$(($gid+1)):$(($subgidSize-$gid)) \
  "$IMAGE"
