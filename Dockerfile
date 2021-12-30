FROM ubuntu

LABEL maintainer="florian.widder@live.de"

ADD init.sh "/usr/local/bin/init.sh"

RUN apt update && \
    apt upgrade --yes && \
    apt install --yes ubuntu-desktop && \
    apt install --yes xrdp && \
    adduser xrdp ssl-cert && \
    systemctl restart xrdp && \
    chmod +x /init/init.sh &&\
    groupadd -r user -g 911 && \
    useradd -u 911 -r -g user -s /bin/bash -c "Docker image user" user

CMD ["/bin/bash", "/usr/local/bin/init.sh"]
