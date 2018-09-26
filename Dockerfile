# Run the Chromium browser in a container
#
# Build or update image:
#   docker build --no-cache -t local/chromium .
#
# Ubuntu 18.04 Pulseaudio modification of MaxMilton's docker-chromium

FROM ubuntu

RUN set -xe \
  && useradd -d /home/chromium -G audio,video -m -s /bin/bash chromium \
  && apt update \
  && apt -y install \
     alsa-base \
     alsa-utils \
     pulseaudio \
     libcanberra-gtk-module \
     libcanberra-gtk3-module \
     chromium-browser 

# override default launcher
COPY chromium-launcher.sh /usr/lib/chromium/chromium-launcher.sh

# custom chromium flags
COPY default.conf /etc/chromium/default.conf

# custom font config
COPY local.conf /etc/fonts/local.conf

# run as non privileged user
USER chromium 

ENTRYPOINT ["/usr/bin/chromium-browser"]
CMD ["about:blank"]
