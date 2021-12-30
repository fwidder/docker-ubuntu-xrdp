FROM ubuntu

LABEL maintainer="florian.widder@live.de"

ADD start.sh "/usr/local/bin/start.sh"

ENV DEBIAN_FRONTEND=noninteractiv

RUN apt update && \
    apt upgrade --yes && \
    apt install --yes ubuntu-desktop && \
    apt install --yes xrdp && \
    adduser xrdp ssl-cert && \
    chmod +x /init/init.sh &&\
    groupadd -r user -g 911 && \
    useradd -u 911 -r -g user -s /bin/bash -c "Docker image user" user

CMD ["/bin/bash", "/usr/local/bin/start.sh"]
