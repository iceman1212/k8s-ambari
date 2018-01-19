FROM python:2.7
MAINTAINER binux <roy@binux.me>

# add all repo
ADD ./ /opt/pyspider
ADD ./sources.list /etc/apt
ADD ./instantclient_11_2 /opt/oracle/instantclient_11_2

# install phantomjs
RUN mkdir -p /opt/phantomjs \
        && cd /opt/phantomjs \
        && wget -O phantomjs.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
        && tar xavf phantomjs.tar.bz2 --strip-components 1 \
        && ln -s /opt/phantomjs/bin/phantomjs /usr/local/bin/phantomjs \
        && rm phantomjs.tar.bz2 \
		&& cd /opt/oracle/instantclient_11_2 \
        && ln -s libclntsh.so.11.1 libclntsh.so \
        && apt-get update \
        && apt-get install libaio1 \
        && apt-get install libaio-dev \
        && export LD_LIBRARY_PATH=/opt/oracle/instantclient_11_2:$LD_LIBRARY_PATH \
        && sh -c "echo /opt/oracle/instantclient_11_2 > /etc/ld.so.conf.d/oracle-instantclient.conf" \
        && ldconfig \
        && apt-get clean


# install requirements
RUN pip install --egg 'https://dev.mysql.com/get/Downloads/Connector-Python/mysql-connector-python-2.1.5.zip#md5=ce4a24cb1746c1c8f6189a97087f21c1'
COPY requirements.txt /opt/pyspider/requirements.txt
RUN pip install -r /opt/pyspider/requirements.txt

# run test
WORKDIR /opt/pyspider
RUN pip install -e .[all]

ENV LD_LIBRARY_PATH /opt/oracle/instantclient_11_2

VOLUME ["/opt/pyspider"]
ENTRYPOINT ["pyspider"]

EXPOSE 5000 23333 24444 25555
