FROM ubuntu:16.04
RUN apt-get install build-essential checkinstall
RUN apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev
WORKDIR /usr/src
RUN wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz
RUN  tar xzf Python-3.7.4.tgz
RUN cd Python-3.7.4
RUN ./configure --enable-optimizations
RUN make altinstall
RUN python3.7 -V
RUN alias python=”python3.7”
RUN source ~/.bashrc
RUN python -V
RUN  apt-get install curl
RUN  curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN  python3.7 get-pip.py