sudo yum -y upgrade
sudo yum -y install yum-fastestmirror
sudo rpm --import http://dnmouse.org/RPM-GPG-KEY-dnmouse
yum -y --nogpgcheck install http://dnmouse.org/autoplus-1.2-2.noarch.rpm //Install Autoten
sudo yum -y install mysql mysql-server mysql-workbench phpMyAdmin //Install mysql php perl etc 
sudo yum  -y install git-core git-gui git-doc //git install
sudo yum -y install httpd //Apache Install
sudo yum -y install ant-contrib #Install required for HTML5 BoilerPlate Build Script 
ssh-keygen -t rsa -C "mahinthjoe@gmail.com"
#Github.com Configuration
git config --global user.name "Mahinth Christensen"
git config --global user.email "mahinthjoe@gmail.com"
git config --global github.user mahinthjoe
git config --global github.token 08ea2faac8bfb116f9e98a6cd7d895f5
sudo yum -y install p7zip p7zip-plugins unrar
//mysql configuration
sudo service mysqld start
sudo mysqladmin -u root password root
//Apache Configuration
sudo mv /var/www /home/ 
sudo useradd -g users www
sudo chown -R www:users /home/www
sudo chmod -R 755 /home/www
#sudo cp -f /home/mahinthjoe/code/Code/httpd.conf /etc/httpd/conf/
sudo /etc/init.d/httpd start //Start Apache 
sudo pgrep httpd 
sudo service mysqld status
sudo pgrep mysql
sudo yum -y install vsftpd
sudo useradd ftpwordpress -d /home/www/html/wordpress
sudo passwd ftpwordpress
sudo /etc/init.d/vsftpd start
sudo setsebool -P allow_ftpd_full_access 1 #to allow SELinux access by vsftpd to home directory
#set startup command for the installed softwares at system startup
sudo chkconfig httpd on
sudo chkconfig mysqld on
sudo chkconfig vsftpd on
#install wordpress/ in /home/www/html before proceding Download latest.tar.gz from wordpress.org
sudo tar -xf latest.tar.gz -C /home/www/html/
#edit wp-config.php in wordpress/
sudo mv /home/www/html/wordpress/wp-config-sample.php /home/www/html/wordpress/wp-config.php
#Set Database Username password database in wp-config.php
#configure vsftpd.conf Set Anonymous_Enable=NO sudo vi /etc/vsftpd/vsftpd.conf
sudo mkdir /home/www/html/wordpress/wp-content/upgrade
sudo chmod -R 777 /home/www/html/wordpress/wp-content/upgrade
sudo mkdir /home/www/html/wordpress/wp-content/uploads
sudo chmod -R 777 /home/www/html/wordpress/wp-content/uploads
#Permissions and SELinux Configuration
#sudo chcon -R -h -t httpd_sys_content_t  /home/www
#sudo chcon -h -t httpd_sys_script_exec_t /home/www/cgi-bin
#sudo setsebool -P httpd_can_network_relay 1
#sudo setsebool -P allow_ypbind 1
#SELinux enable write to .htaccess by httpd process
sudo emanage fcontext -a -t httpd_sys_rw_content_t '.htaccess'
sudo restorecon -v '.htaccess'
sudo setsebool -P allow_ypbind 1 #enable wordpress update via Wordpress Control Panel ftp

sudo rpm -vhi adobe-release-i386-1.0-1.noarch.rpm
sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux
sudo yum install -y ld-linux.so.2 gtk2-devel.i686 libdbus-glib-1.so.2 libhal.so.1 rpm-devel.i686 libXt.so.6 gnome-keyring-devel.i686 libDCOP.so.4 libxml2-devel.i686 nss-devel.i686 libxslt.i686 xterm rpm-build

