FROM phusion/baseimage:master

RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/mirrors.aliyun.com/g" /etc/apt/sources.list
RUN apt-get update && apt-get -y dist-upgrade
RUN apt-get install -y lib32z1 xinetd build-essential

RUN rm -f /etc/service/sshd/down && /etc/my_init.d/00_regen_ssh_host_keys.sh > /dev/null 2>&1
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN echo 'root:e99root' | chpasswd
RUN sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

RUN useradd -g www-data ctf -m && \
    echo 'ctf:123456qaz' | chpasswd

COPY ./flag.txt /flag
COPY ./calculator /home/ctf/calculator
COPY ./ctf.xinetd /etc/xinetd.d/ctf

RUN chown ctf:www-data /home/ctf/calculator && chmod 777 /home/ctf/calculator

RUN echo 'ctf - nproc 1500' >>/etc/security/limits.conf

CMD exec /bin/bash -c "/etc/init.d/ssh start; /etc/init.d/xinetd start; trap : TERM INT; sleep infinity & wait"
