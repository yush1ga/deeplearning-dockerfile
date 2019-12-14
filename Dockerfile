FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

RUN apt update -y
RUN apt install -y curl git unzip imagemagick bzip2 graphviz vim wget zlib1g-dev libssl-dev libsqlite3-dev libbz2-dev g++ cmake libboost-dev libboost-python-dev libboost-system-dev language-pack-ja liblzma-dev

RUN locale-gen ja_JP.UTF-8
RUN update-locale LANG=ja_JP.UTF-8

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:en
ENV LC_ALL ja_JP.UTF-8

RUN git clone git://github.com/pyenv/pyenv.git .pyenv

WORKDIR /
ENV HOME  /
ENV PYENV_ROOT /.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

WORKDIR /workspace

RUN pyenv install 3.6.5
RUN pyenv global 3.6.5
RUN pyenv rehash

RUN pip install --upgrade pip
RUN pip install keras==2.2.4 tensorflow-gpu==1.14.0 scikit-learn opencv-contrib-python jupyter jupyter_contrib_nbextensions pandas matplotlib tqdm
RUN jupyter contrib nbextension install
