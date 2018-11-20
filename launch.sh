# allow X11 forwarding permission
xhost +local:"$USER"

docker run --rm --device /dev/snd -e DISPLAY=unix"$DISPLAY" --volume /tmp/.X11-unix:/tmp/.X11-unix  --volume /dev/shm:/dev/shm -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native -v ~/.config/pulse/cookie:/root/.config/pulse/cookie --group-add $(getent group audio | cut -d: -f3) --security-opt seccomp=seccomp.json local/chromium "$@"
