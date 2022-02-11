FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils dialog 2>&1
RUN apt-get install -y git
RUN apt-get install -y build-essential
RUN apt-get install -y gawk
RUN apt-get install -y bsdmainutils
RUN apt-get install -y tzdata
RUN apt-get install -y translate-shell wamerican
RUN apt-get autoremove -y
RUN apt-get clean -y
RUN rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND=dialog
ENV LESSCHARSET=utf-8
