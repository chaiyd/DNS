# DNS

## https://github.com/chaiyd/DNS.git


- 基于alpine linux 构建
- 参考docker-compose自行添加环境变量来解析相应域名
  ```
  DOMAIN="baidu.com"
  NS="ns    A   192.168.1.1\nceshi  A 192.168.1.1"
  ```  
- 可以自行修改docker-compose文件
- ~~可以自行修改xxx.com.zone 和named.conf 文件~~
- ~~配置中xxx.com 替换为自己域名即可~~
- ~~修改ip为自己服务器ip即可~~
