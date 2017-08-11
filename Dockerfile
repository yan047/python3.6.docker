# Version: 1.0
# Name: Python3.6 
# using miniconda3

FROM ubuntu:16.04

MAINTAINER "boyan.au@gmail.com"

# In case someone loses the Dockerfile
RUN rm -rf /etc/Dockerfile
# ADD Dockerfile /etc/Dockerfile

# set environment variables
ENV WORK_BASE /var/work
ENV ANACONDA_PACKAGE Miniconda3-latest-Linux-x86_64.sh
ENV INSTALL_DIR /var/miniconda3

# must run with user root
USER root

# Install utility software

RUN apt-get update  && apt-get install -y wget unzip curl bzip2 git vim \
                    && apt-get clean

# create work directory
RUN mkdir -p "$WORK_BASE"
WORKDIR "$WORK_BASE"

# install miniconda3
RUN wget --quiet https://repo.continuum.io/miniconda/"$ANACONDA_PACKAGE" && \
    /bin/bash "$WORK_BASE"/"$ANACONDA_PACKAGE" -b -p "$INSTALL_DIR" && \
    rm "$WORK_BASE"/"$ANACONDA_PACKAGE"

ENV PATH "$INSTALL_DIR"/bin:$PATH

