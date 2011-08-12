sudo yum -y upgrade
sudo 'rpm --import http://dnmouse.org/RPM-GPG-KEY-dnmouse'
sudo 'yum -y --nogpgcheck install http://dnmouse.org/autoplus-1.1-8.noarch.rpm' 
sudo yum -y install httpd
sudo chkconfig httpd on
sudo /etc/init.d/httpd start
sudo pgrep httpd
sudo useradd -g users www
sudo chown -R mahinthjoe:users /home/mahinthjoe/www
sudo chmod -R 755 /home/mahinthjoe/www
sudo yum -y install mysql mysql-server mysql-workbench
sudo chkconfig mysqld on
sudo service mysqld status
sudo pgrep mysql
mysqladmin -u root password root

sudo chcon -R -h -t httpd_sys_content_t  /home/mahinthjoe/www
sudo chcon -h -t httpd_sys_script_exec_t /home/mahinthjoe/www/cgi-bin

sudo -y install vsftpd
sudo service vsftpd start
sudo service vsftpd status

