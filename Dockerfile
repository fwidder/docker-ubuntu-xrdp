FROM ubuntu

LABEL maintainer="florian.widder@live.de"

ADD init.sh "/usr/local/bin/init.sh"

RUN sudo apt update && \
    sudo apt upgrade --yes && \
    sudo apt install --yes ubuntu-desktop && \
    sudo apt install --yes xrdp && \
    sudo adduser xrdp ssl-cert && \
    sudo systemctl restart xrdp && \
    sudo chmod +x /init/init.sh &&\
    sudo groupadd -r user -g 911 && \
    sudo useradd -u 911 -r -g user -s /bin/bash -c "Docker image user" user

CMD ["/bin/bash", "/usr/local/bin/init.sh"]
