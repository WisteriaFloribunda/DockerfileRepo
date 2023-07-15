FROM ubuntu:latest

RUN mkdir /ngrok
WORKDIR /ngrok
ADD https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz ./
RUN apt update && \
    apt install wget tar -y && \
    tar xvfz ngrok-v3-stable-linux-amd64.tgz && \
    rm ngrok-v3-stable-linux-amd64.tgz
FROM alpine:latest

COPY --from=0 /ngrok /ngrok
COPY docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh 
WORKDIR /ngrok
ENV token token
ENV port app:25565
ENV pro tcp

ENTRYPOINT ["docker-entrypoint.sh"]
CMD [ "ash","-c","./ngrok --config ngrok.yml $pro $port" ]