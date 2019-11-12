FROM ubuntu:16.04
RUN  apt update -y
RUN  apt install software-properties-common -y
RUN  add-apt-repository ppa:deadsnakes/ppa  -y
RUN  apt update -y
RUN  apt install python3.7 -y

RUN  apt-get install curl
RUN  curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN  python3.7 get-pip.py
RUN  pip install Django
RUN apt-get install libpq-dev python-dev -y
COPY requirements.txt .
RUN pip3 install -r requirements.txt