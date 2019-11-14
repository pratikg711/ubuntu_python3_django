FROM amazonlinux:with-sources
RUN apt-get update
RUN apt-get install build-essential checkinstall -y
RUN apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev -y 
RUN apt-get install -y wget
WORKDIR /usr/src
RUN wget https://www.python.org/ftp/python/3.5.6/Python-3.5.6.tgz
RUN tar xzf Python-3.5.6.tgz
WORKDIR Python-3.5.6
RUN ./configure --enable-optimizations  --prefix=/usr 
RUN make altinstall
RUN python3.5 -V
RUN  apt-get install curl -y
RUN  curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN  python3.5 get-pip.py
COPY requirements.txt .
RUN pip3 install -r requirements.txt
RUN pip install psycopg2-binary
RUN apt-get install -y cron
RUN service cron start
RUN service cron status