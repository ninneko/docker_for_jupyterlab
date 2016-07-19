FROM jupyter/minimal-notebook

MAINTAINER Yohei Naruse <yohei.naruse@bizreach.co.jp>

USER root

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list  && \
    echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list  && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886  && \
    apt-get update


RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections  && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections  && \
    DEBIAN_FRONTEND=noninteractive  apt-get install -y --force-yes oracle-java8-installer oracle-java8-set-default

USER $NB_USER

RUN wget https://git.io/vrHhi -O jupyter-scala && chmod +x jupyter-scala && ./jupyter-scala && rm -f jupyter-scala

RUN pip install jupyterlab

RUN jupyter serverextension enable --py jupyterlab

CMD jupyter lab
