FROM debian:latest

MAINTAINER ferriere.florian@gmail.com

ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

# for run dpkg faster
RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup

# add no-cache header for apt http requests
RUN echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache

RUN apt-get update -y && \
    apt-get install -y locales net-tools procps acl curl vim --no-install-recommends

RUN echo "Europe/Paris" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata && \
    sed -i "s/^# fr_FR/fr_FR/" /etc/locale.gen && \
    locale-gen && \
    update-locale LANG=fr_FR.UTF-8

RUN useradd --uid 1000 --create-home user

