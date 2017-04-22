FROM ubuntu:16.04
MAINTAINER Aleksandar Ivanov <smiche@dir.bg>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y software-properties-common python-software-properties

RUN add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y ssh-client libc6-i386 wget php5.6 --allow-unauthenticated
RUN apt-get install -y lib32stdc++6
RUN echo 'variables_order = "EGPCS"' >> /etc/php/5.6/cli/php.ini

RUN useradd -ms /bin/bash game
WORKDIR /home/game
ADD et /home/game/
RUN chown game:game -Rf /home/game/
USER game

EXPOSE 27960/UDP
CMD php start