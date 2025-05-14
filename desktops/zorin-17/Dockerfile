ARG BASE_DESKTOP_IMAGE
FROM ${BASE_DESKTOP_IMAGE}

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:zorinos/stable && \
    add-apt-repository ppa:zorinos/patches && \
    add-apt-repository ppa:zorinos/apps && \
    apt-get update && \
    apt-get install -y zorin-os-keyring

COPY root /

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y language-pack-en-base zorin-os-desktop brave-browser dbus-x11 sudo flatpak && \
    locale-gen && \
    update-locale LANG=en_US.UTF-8 && \
    for file in $(find /usr -type f -iname "*login1*"); do mv -v $file "$file.back"; done && \
    chmod u+s /usr/bin/bwrap

RUN chmod 777 /opt/gow/desktop.sh