FROM ubuntu:20.04

ADD deb/. /root/deb

RUN sed -i -E 's/(archive|security|ports).ubuntu.(org|com)/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y ca-certificates tzdata dumb-init wget net-tools && \
    ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    dpkg -i /root/deb/phddns_5.2.0_amd64.deb && \
    rm -rf /etc/phtunnel.json && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["bash", "-c", "phddns start && bash -c 'while true; do sleep 3600; done'"]