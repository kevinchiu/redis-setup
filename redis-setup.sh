apt-get install build-essential tcl -y -q

echo "net.ipv4.ip_local_port_range = 1024 65535" >> /etc/sysctl.conf
echo "fs.file-max = 200000" 					 >> /etc/sysctl.conf
 
echo "session required pam_limits.so"			 >> /etc/security/limits.conf
echo "* soft nproc 2500"						 >> /etc/security/limits.conf
echo "* hard nproc 10000"						 >> /etc/security/limits.conf
echo "* soft nofile 200000"						 >> /etc/security/limits.conf
echo "* hard nofile 200000"						 >> /etc/security/limits.conf

wget "http://redis.googlecode.com/files/redis-2.4.4.tar.gz"
tar -xf redis-2.4.4.tar.gz

pushd 'redis-2.4.4/src/'

sed 's/1024\*10/1024\*64/' ae.h > ae.h2
mv ae.h2 ae.h

make
make install

echo "------------"
echo "REBOOTING..."
echo "------------"

reboot