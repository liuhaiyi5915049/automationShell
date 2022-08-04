yum install -y epel-release
yum install -y pure-ftpd
cd /etc/pure-ftpd/
#找到PureDB /etc/pure-ftpd/pureftpd.pdb这一行，删除这一行前面的#号
sed -i "/PureDB/d" pure-ftpd.conf
sed -i '$a PureDB /etc/pure-ftpd/pureftpd.pdb' pure-ftpd.conf
#启动pure-ftpd
systemctl start pure-ftpd
#查看启动状态
ss -naltp |grep pure-ftpd
#创建存储目录
mkdir -p /www/wwwqingyiftp/parkftp
#创建用户
useradd -u 1010 qingyi
#创建系统用户、组并给文件授权
chown -R qingyi:qingyi /www/wwwqingyiftp/parkftp
#创建虚拟用户与系统用户qingyi关联在一起
pure-pw   useradd  qingyiftp -u qingyi -d /www/wwwqingyiftp/parkftp <<EOF
MlC6HhuzFvszxtaSQHBrrreuHxnd5D4u
MlC6HhuzFvszxtaSQHBrrreuHxnd5D4u
EOF
#创建用户信息数据库文件
pure-pw mkdb
#列出当前账号
pure-pw list
#安装lftp客户端
yum install -y lftp
#防火墙配置
firewall-cmd --zone=public --add-port=11-21/tcp --permanent
firewall-cmd --zone=public --add-port=30000-40000/tcp --permanent
firewall-cmd --add-service=ftp --permanent
firewall-cmd --reload
