FROM ubuntu:latest
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git curl python3 python3-pip openjdk-17-jdk sudo iftop && \
    curl -SL https://deb.nodesource.com/setup_20.x | bash && \
    apt-get install -y nodejs &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    curl -sL "https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64" \
        --output /tmp/vscode-cli.tar.gz && \
    tar -xf /tmp/vscode-cli.tar.gz -C /usr/bin && \
    rm /tmp/vscode-cli.tar.gz
CMD [ "code", "tunnel", "--accept-server-license-terms", "--cli-data-dir", "~","--name","tunnel" ]
