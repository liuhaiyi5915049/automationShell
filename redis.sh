echo "开始安装redis"
yum install gcc-c++ -y
gcc -v
#解压
cd /opt/redis/
tar -zxvf redis-7.0.4.tar.gz
cd redis-7.0.4
make
make install 
cd /usr/local/bin
cd /opt/redis/redis-7.0.4
chmod -R 777 /usr/local/bin
cp redis.conf /usr/local/bin
cd /usr/local/bin
sed -i 's/bind 127.0.0.1 -::1/bind 0.0.0.0/g' redis.conf
sed -i 's/# requirepass foobared/ requirepass park@qy123./g' redis.conf
sed -i 's/daemonize no/daemonize yes/g' redis.conf
sed -i 's/protected-mode yes/protected-mode no/g' redis.conf
echo "启动redis"
./redis-server redis.conf
ps aux|grep redis
firewall-cmd --zone=public --add-port=6379/tcp --permanent
firewall-cmd --reload
