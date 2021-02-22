第一次办线上AWD
使用的是Cardinal环境
https://github.com/vidar-team/Cardinal/releases/tag/v0.7.3

题目使用的是:https://github.com/glzjin/20190511_awd_docker/
因为比较老了，原github上的docker文件直接运行会出问题
修改了挺多地方，现在可以跑起来了
./Cardinal
启动好靶机，然后访问http://x.x.x.x:8888/manager
配置好靶机就可以了


当前靶机的配置为：
team1:
pwn1: 10011  ssh:20011 ctf/123456qaz   root/e99root
web1: 10012  ssh:20012 ctf/123456wsx   root/e99root
web2: 10013  ssh:20013 ctf/123456edc   root/e99root
web3: 10014  ssh:20014 ctf/123456rfv   root/e99root
team2:
pwn1: 10021  ssh:20021 ctf/123456qaz   root/e99root
web1: 10022  ssh:20022 ctf/123456wsx   root/e99root
web2: 10023  ssh:20023 ctf/123456edc   root/e99root
web3: 10024  ssh:20024 ctf/123456rfv   root/e99root
