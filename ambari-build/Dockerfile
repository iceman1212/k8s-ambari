FROM centos:6.9
maintainer  le.yin <le.yin@howbuy.com>
ARG yumhost=""
RUN curl -o /root/jdk-8u112-linux-x64.tar.gz http://${yumhost}/jdk-8u112-linux-x64.tar.gz \
    && curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo \
    && curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-6.repo \
    && yum install gcc make gcc-c++ openssl-devel wget rpm-build -y && yum clean all \
    && curl -o /root/apache-maven-3.5.2-bin.tar.gz http://${yumhost}/apache-maven-3.5.2-bin.tar.gz \
    && tar -xf /root/jdk-8u112-linux-x64.tar.gz -C /root && mv /root/jdk1.8.0_112 /usr/local/jdk \
    && tar -xf /root/apache-maven-3.5.2-bin.tar.gz -C /root && mv /root/apache-maven-3.5.2 /usr/local/apache-maven \
    && rm -rf /root/jdk-8u112-linux-x64.tar.gz && rm -rf /root/apache-maven-3.5.2-bin.tar.gz \
    && mkdir -p /tmp/npm_config_tmp/phantomjs && curl -o /tmp/npm_config_tmp/phantomjs/phantomjs-2.1.1-linux-x86_64.tar.bz2 http://${yumhost}/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
    && mkdir -p /tmp/phantomjs \
    && curl -o /tmp/phantomjs/phantomjs-1.9.7-linux-x86_64.tar.bz2  http://${yumhost}/phantomjs-1.9.7-linux-x86_64.tar.bz2 \
    && curl -o /tmp/phantomjs/phantomjs-1.9.8-linux-x86_64.tar.bz2  http://${yumhost}/phantomjs-1.9.8-linux-x86_64.tar.bz2 \
    && curl -o /root/git-2.9.5.tar.gz http://${yumhost}/git-2.9.5.tar.gz && tar -xf /root/git-2.9.5.tar.gz -C /root \
    && cd /root/git-2.9.5 && yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker -y \
    && make prefix=/usr/local/git all && make prefix=/usr/local/git install \
    && curl -o /root/Python-2.7.11.tgz http://${yumhost}/Python-2.7.11.tgz \
    && tar -xf /root/Python-2.7.11.tgz -C /root \
    && cd /root/Python-2.7.11 && ./configure && make all && make install \
    && mv /usr/bin/python /usr/bin/python2.6.6 && ln -s /usr/local/bin/python2.7 /usr/bin/python \
    && sed -i 's/python/python2.6.6/g' /usr/bin/yum \
    && curl -o /root/setuptools-38.2.5.zip  http://${yumhost}/setuptools-38.2.5.zip \
    && cd /root && unzip /root/setuptools-38.2.5.zip && cd /root/setuptools-38.2.5 \
    && python setup.py build && python setup.py install

ENV JAVA_HOME=/usr/local/jdk
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV MVN_HOME=/usr/local/apache-maven
ENV PATH=$MVN_HOME/bin:$JAVA_HOME/bin:$PATH:/usr/local/git/bin
