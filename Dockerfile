FROM nvidia/cuda:9.0-cudnn7-runtime

RUN apt-get update
RUN apt-get install -y curl git unzip imagemagick bzip2 graphviz vim wget zlib1g-dev libssl-dev libsqlite3-dev libbz2-dev libreadline6 libreadline6-dev
RUN apt-get install -y --allow-downgrades libcudnn7-dev=7.0.5.15-1+cuda9.1 libcudnn7=7.0.5.15-1+cuda9.1 g++ cmake libboost-dev libboost-python-dev libboost-system-dev
RUN apt-mark hold libcudnn7 libcudnn7-dev
RUN git clone git://github.com/yyuu/pyenv.git .pyenv

WORKDIR /
ENV HOME  /
ENV PYENV_ROOT /.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN pyenv install 3.6.5
RUN pyenv install 2.7.11
RUN pyenv global 3.6.5 2.7.11
RUN pyenv rehash

RUN pip install --upgrade pip
RUN pip install --ignore-installed tensorflow-gpu numpy keras kaggle-cli gym scikit-learn pandas matplotlib pydot graphviz pydot3 pydot-ng opencv-python tqdm h5py chainer flake8
RUN pip install http://download.pytorch.org/whl/cu80/torch-0.2.0.post3-cp36-cp36m-manylinux1_x86_64.whl
RUN pip install dask --upgrade
RUN pip install jupyter jupyterlab
RUN mkdir -p workspace
