FROM ubuntu:latest
RUN mkdir /temp
WORKDIR /temp
ENV url=https://jp.softether-download.com/files/softether/v4.42-9798-rtm-2023.06.30-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.42-9798-rtm-2023.06.30-linux-x64-64bit.tar.gz
RUN apt update && \
    apt install wget tar build-essential -y

RUN wget -O temp.tar.gz ${url}
RUN tar -xzvf temp.tar.gz && \
    cd vpnserver && \
    make
RUN chown -R root:root vpnserver && \
    chmod 600 vpnserver/* && \
    chmod 700 vpnserver/vpncmd && \
    chmod 700 vpnserver/vpnserver

FROM ubuntu:latest
RUN apt update && \
    apt install iptables iptables-persistent -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /vpnserver
COPY --from=0 /temp/vpnserver /vpnserver/
EXPOSE 443/tcp 992/tcp 1194/tcp 5555/tcp 1194/udp 500/udp 4500/udp
CMD [ "bash","-c","./vpnserver execsvc" ]