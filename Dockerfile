FROM centos:6.9
maintainer  le.yin <le.yin@howbuy.com>
ARG yumhost=""
RUN curl -o /etc/yum.repos.d/ambari.repo  http://${yumhost}/ambari.repo \
    && curl -o /etc/yum.repos.d/hdp.repo  http://${yumhost}/hdp.repo \
    && curl -o /etc/yum.repos.d/hdp-util.repo  http://${yumhost}/hdp-util.repo \
    && curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo \
    && curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-6.repo \
    && yum update -y \
    && yum install -y yum-utils yum-plugin-ovl tar git curl bind-utils unzip wget \
    && yum install -y krb5-workstation \
    && yum install -y initscripts \
    && yum install -y openssh openssh-server openssh-clients \
    && mkdir /var/run/sshd && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key && ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key \
    && /bin/echo 'root:123456'|chpasswd \
    && /bin/sed -i 's/.*session.*required.*pam_loginuid.so.*/session optional pam_loginuid.so/g' /etc/pam.d/sshd \
    && /bin/echo -e "LANG=\"en_US.UTF-8\"" > /etc/default/local \
    && yum install -y ambari-server ambari-agent \
    && mkdir -p /var/lib/ambari-server/resources \
    && curl -o /var/lib/ambari-server/resources/jdk-8u112-linux-x64.tar.gz http://${yumhost}/jdk-8u112-linux-x64.tar.gz \
    && curl -o /var/lib/ambari-server/resources/jce_policy-8.zip http://${yumhost}/jce_policy-8.zip \
    && chmod +x /var/lib/ambari-server/resources/jdk-8u112-linux-x64.tar.gz \
    && chmod +x /var/lib/ambari-server/resources/jce_policy-8.zip \
    && yum install expect-devel expect -y \
    && yum clean all \
    && curl -o /root/sshkeygen.sh http://${yumhost}/sshkeygen.sh \
    && chmod 755 /root/sshkeygen.sh \
    && /root/sshkeygen.sh \
    && cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys
