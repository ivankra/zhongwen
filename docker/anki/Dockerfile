# Anki docker container with fcitx5 IME support.
#
# Anki version in debian repos is too old, besides it could really benefit
# from containerization when using third party addons.
#
# Prereqs:
#   * docker or better yet podman
#   * x11docker
#   * `apt-get install nxagent xclip` for some features
#   * `echo software >~/.local/share/Anki2/gldriver6` maybe to fix some rendering issues
#   * `podman build -f Dockerfile -t anki`
#
# Sample run command:
# x11docker \
#   --backend=podman \
#   --nxagent \
#   --pulseaudio \
#   --lang=en_US.UTF-8 \
#   --clipboard \
#   --hostdbus \
#   --network \
#   -- \
#   --cap-add=sys_chroot \
#   --shm-size=1g \
#   --tmpfs="$HOME/.cache" \
#   --volume="$HOME/.config/fcitx5:$HOME/.config/fcitx5:ro" \
#   --volume="$HOME/.local/share/Anki2:$HOME/.local/share/Anki2:rw" \
#   anki

FROM debian:stable

ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i -e 's/ main/ main contrib non-free/g' /etc/apt/sources.list.d/debian.sources && \
    apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        locales \
        wget \
        zstd \
        # Input method support via fcitx. Needs --hostdbus to talk to fcitx5 on host.
        fcitx5 \
        fcitx5-chinese-addons \
        fcitx5-frontend-gtk2 \
        fcitx5-frontend-gtk3 \
        fcitx5-frontend-qt5 \
        fcitx5-frontend-qt6 \
        fcitx5-material-color \
        # Fonts, some from non-free. noto-color-emoji for country flags.
        fonts-moe-standard-kai \
        fonts-moe-standard-song \
        fonts-noto \
        fonts-noto-cjk \
        fonts-noto-color-emoji \
        fonts-opensymbol \
        fonts-roboto \
        fonts-roboto-hinted \
        fonts-wqy-microhei \
        fonts-wqy-zenhei \
        # mpv (or mplayer) for anki's audio playback
        mpv \
        # Various runtime dependencies
        libasound2 \
        libdbus-1-3 \
        libegl1 \
        libfontconfig1 \
        libfreetype6 \
        libgl1 \
        libglib2.0-0 \
        libnss3 \
        libqt6gui6 \
        libxcb-cursor0 \
        libxcb-icccm4 \
        libxcb-image0 \
        libxcb-keysyms1 \
        libxcb-randr0 \
        libxcb-render-util0 \
        libxcb-shape0 \
        libxcb-xinerama0 \
        libxcb-xkb1 \
        libxcomposite1 \
        libxcursor1 \
        libxi6 \
        libxkbcommon-x11-0 \
        libxkbcommon0 \
        libxrandr2 \
        libxrender1 \
        libxtst6

# MESA libs to experiment with gpu acceleration (optional)
#RUN apt-get install -y --no-install-recommends libgl1-mesa-dri libgl1-mesa-glx mesa-utils mesa-utils-extra

# Install a dummy script as a system browser that just copies links to be open to clipboard (optional)
RUN apt-get install -y --no-install-recommends xdg-utils xsel zenity && \
    { echo '#!/bin/bash'; \
      echo 'echo "$@" | xsel -b'; \
      echo 'zenity --notification --text "Link copied: $@" --timeout 10'; } >/usr/local/bin/dummy-browser.sh && \
    chmod a+rx /usr/local/bin/dummy-browser.sh && \
    { echo '[Desktop Entry]'; \
      echo 'Name=Dummy Browser'; \
      echo 'Exec=/usr/local/bin/dummy-browser.sh %u'; \
      echo 'Type=Application'; \
      echo 'Terminal=false'; \
      echo 'Categories=Network;WebBrowser;'; \
      echo 'MimeType=x-scheme-handler/http;x-scheme-handler/https;'; \
      echo 'X-MultipleArgs=false'; } >/usr/share/applications/dummy-browser.desktop && \
    chmod a+r /usr/share/applications/dummy-browser.desktop && \
    xdg-settings set default-web-browser dummy-browser.desktop

# Download and run anki installer

ARG ANKI_VERSION=2.1.65

RUN echo "en_US.UTF-8 UTF-8" >/etc/locale.gen && locale-gen && \
    cd /tmp && \
    wget "https://github.com/ankitects/anki/releases/download/${ANKI_VERSION}/anki-${ANKI_VERSION}-linux-qt6.tar.zst" && \
    tar xf anki-*.tar.zst && \
    rm -f anki-*.tar.zst && \
    cd anki-*/ && \
    # Disable xdg-mime due to some weird "No writable system mimetype directory found" errors
    sed -i -e 's/^xdg-mime /#xdg-mime /' install.sh && \
    ./install.sh && \
    cd .. && \
    rm -rf anki-*/

ENV LC_ALL=en_US.UTF-8
ENV GTK_IM_MODULE=fcitx5
ENV QT_IM_MODULE=fcitx5
ENV XMODIFIERS=@im=fcitx5
ENV DefaultIMModule=fcitx5
ENV DISABLE_QT5_COMPAT=1
#ENV QT_DEBUG_PLUGINS=1  # debugging missing qt libs

# Run with a basic qt terminal app for console access and debugging
#RUN apt-get install -y --no-install-recommends qterminal
#CMD /usr/bin/qterminal -e anki

# Run anki directly
CMD /usr/local/bin/anki
