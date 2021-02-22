FROM phusion/baseimage:master

RUN rm -f /etc/service/sshd/down
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/mirrors.aliyun.com/g" /etc/apt/sources.list
RUN apt update
RUN apt install nginx -y
RUN apt install python3 python3-distutils -y

COPY ./get-pip.py /tmp/get-pip.py
RUN python3 /tmp/get-pip.py

RUN pip3 install Flask==0.11.1 -i https://mirrors.aliyun.com/pypi/simple/
RUN pip3 install flask_sqlalchemy -i https://mirrors.aliyun.com/pypi/simple/
RUN pip3 install flask_bcrypt -i https://mirrors.aliyun.com/pypi/simple/
RUN pip3 install flask_login -i https://mirrors.aliyun.com/pypi/simple/
RUN pip3 install flask_mail -i https://mirrors.aliyun.com/pypi/simple/
RUN pip3 install email_validator -i https://mirrors.aliyun.com/pypi/simple
RUN pip3 install flask_wtf -i https://mirrors.aliyun.com/pypi/simple/
RUN pip3 install Werkzeug==0.16.0 -i https://mirrors.aliyun.com/pypi/simple/
RUN pip3 install pyyaml==5.3 -i https://mirrors.aliyun.com/pypi/simple/

ADD ./default /etc/nginx/sites-enabled/

RUN echo 'root:e99root' | chpasswd
RUN sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

RUN useradd -g www-data ctf -m && \
    echo 'ctf:123456wsx' | chpasswd

RUN mkdir /home/ctf/Flaskshop
COPY ./Flaskshop/ /home/ctf/Flaskshop/
RUN chown -R ctf:www-data /home/ctf/Flaskshop/

RUN echo 'flag{afasdfwefdsfasdtweagv}' > /flag

ADD ./start.sh /etc/my_init.d/
RUN chmod u+x /etc/my_init.d/start.sh
