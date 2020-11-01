FROM debian:10.5

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      cmake \
      less \
      python2 \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
