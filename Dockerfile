FROM debian:stretch

RUN apt-get update && \
    apt-get install -y \
    ca-certificates curl file \
    build-essential openssl \
    autoconf automake autotools-dev libtool xutils-dev

# Rust
RUN curl https://sh.rustup.rs -sSf | \
  sh -s -- --default-toolchain stable -y

ENV PATH=/root/.cargo/bin:$PATH
