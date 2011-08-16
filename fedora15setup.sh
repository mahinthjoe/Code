sudo yum -y install yum-fastestmirror
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
sudo yum -y install vsftpd
sudo chkconfig vsftpd on
sudo service vsftpd start
sudo service vsftpd status
sudo yum -y install --enablerepo=rawhide rubygem-rails
sudo yum -y install p7zip p7zip-plugins unrar
sudo rpm -vhi adobe-release-i386-1.0-1.noarch.rpm
sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux
sudo yum install -y ld-linux.so.2 gtk2-devel.i686 libdbus-glib-1.so.2 libhal.so.1 rpm-devel.i686 libXt.so.6 gnome-keyring-devel.i686 libDCOP.so.4 libxml2-devel.i686 nss-devel.i686 libxslt.i686 xterm rpm-build
sudo yum install -y adobeair
sudo yum install -y adobeair
