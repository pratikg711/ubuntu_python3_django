FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install build-essential checkinstall -y
RUN apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev -y \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev -y
RUN apt-get install -y wget
WORKDIR /usr/src
RUN wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz
RUN tar xzf Python-3.7.4.tgz 
WORKDIR Python-3.7.4
RUN ./configure --enable-optimizations  --prefix=/usr 
RUN make altinstall
RUN python3.7 -V
RUN  apt-get install curl -y
RUN  curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN  python3.7 get-pip.py
COPY requirements.txt .
RUN pip3 install -r requirements.txt
RUN pip install psycopg2-binary
RUN apt-get install -y cron
RUN service cron start
RUN service cron status