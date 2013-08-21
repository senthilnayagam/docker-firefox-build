# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Create a build and development environment for Firefox.

FROM ubuntu:12.10
MAINTAINER Gregory Szorc "gps@mozilla.com"

RUN apt-get update

# Upstart and DBus have issues inside docker. We work around that.
RUN dpkg-divert --local --rename --add /sbin/initctl && ln -s /bin/true /sbin/initctl

# Basic build dependencies.
RUN apt-get install -y autoconf2.13 build-essential unzip yasm zip

# Libraries required for building.
RUN apt-get install -y libasound2-dev libcurl4-openssl-dev libdbus-1-dev libdbus-glib-1-dev libgtk2.0-dev libiw-dev libnotify-dev libxt-dev mesa-common-dev uuid-dev

# Gold linker is much faster than standard linker.
RUN apt-get install -y binutils-gold

# Developer tools.
RUN apt-get install -y bash-completion curl emacs git man-db python-dev vim 

# python pip install
RUN apt-get install -y python-setuptools software-properties-common
RUN curl -O https://raw.github.com/pypa/pip/master/contrib/get-pip.py && python get-pip.py

RUN pip install mercurial

# gstreamer
RUN add-apt-repository ppa:gstreamer-developers/ppa
RUN apt-get update
RUN apt-get install -y libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev

# Create a user for development.
RUN useradd -m firefox
