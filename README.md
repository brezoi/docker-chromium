# Chromium In A Container

Launch an ephemeral chromium instance in a Docker container. Useful for times you need to quickly launch a browser that's completely fresh, e.g. web page testing or visiting suspect sites. By default, it's likely this will only run on a Linux desktop with X11 compatibility (e.g. Wayland + `xwayland`).

Modified fork of [docker-chromium by MaxMilton](https://github.com/MaxMilton/docker-chromium) to run with Ubuntu and enable Pulseaudio.

Based on the [amazing work done by jessfraz](https://github.com/jessfraz/dockerfiles/blob/master/chromium/Dockerfile) but with much customisation.

Uses a very opinionated [default configuration](https://github.com/MaxMilton/docker-chromium/blob/master/default.conf) for performance and security.

## Usage

### Build

```sh
docker build -t local/chromium .
```

### Run

_NOTE: The default page is `about:blank` for fast launch time._

```sh
./launch.sh
```

You can optionally pass an alternate Docker command:

```sh
./launch.sh http://localhost:8080 --allow-insecure-localhost
```

#### SELinux volumes

If you're using a system with SELinux enabled (e.g. Fedora Linux) you'll need to add `:z` to the end of each `--volume` so Docker labels the volume correctly.

## Additional considerations

1. Uses a custom set of chromium flags for improved security and performance, see [`default.conf`](https://github.com/MaxMilton/docker-chromium/blob/master/default.conf).

2. `--volume /dev/shm:/dev/shm` is necessary because Docker currently only allocates 64 MB of memory to /dev/shm but chromium needs a lot more to run without crashing. On some systems it my not be required. [More info](https://github.com/c0b/chrome-in-docker/issues/1).

## Licence

Released under the MIT licence; see [LICENCE](https://github.com/MaxMilton/docker-chromium/blob/master/LICENCE).

-----

© 2018 [Max Milton](https://maxmilton.com) parts by brezoi
