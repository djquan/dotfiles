FROM debian:stretch

RUN apt-get update && \
    apt-get install -y \
    ca-certificates curl file git \
    build-essential openssl \
    autoconf automake autotools-dev libtool xutils-dev \
    libssl-dev libreadline-dev zlib1g-dev unzip \
    vim tmux emacs25

ENV PATH="${PATH}:/root/.asdf/shims:/root/.asdf/bin"

WORKDIR /root/dockerfiles
COPY . .
RUN rm /root/.bashrc
RUN ./setup.sh
