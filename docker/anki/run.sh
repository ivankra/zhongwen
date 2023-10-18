#!/bin/bash
set -e -o pipefail

SCRIPT_DIR=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
IMAGE=$(basename "$SCRIPT_DIR")

if ! podman inspect --type=image "$IMAGE:latest" >/dev/null 2>&1; then
  (set -x; cd "$SCRIPT_DIR" && make)
fi

CID=$(podman ps --format "{{.ID}}" --filter "name=$IMAGE")
if ! [[ -z "$CID" ]]; then
  podman kill "$CID"
fi

exec x11docker \
  --backend=podman \
  --nxagent \
  --pulseaudio \
  --lang=en_US.UTF-8 \
  --clipboard \
  --hostdbus \
  --network \
  -i \
  -- \
  --cap-add=sys_chroot \
  --shm-size=1g \
  --tmpfs="$HOME/.cache" \
  --volume="$HOME/.config/fcitx5:$HOME/.config/fcitx5:ro" \
  --volume="$HOME/zhongwen:$HOME/zhongwen:rw" \
  --volume="$HOME/zhongwen/Anki2:$HOME/.local/share/Anki2:rw" \
  "$IMAGE"
