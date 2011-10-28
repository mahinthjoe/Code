#linux 
  sudo yum -y upgrade
  sudo yum -y install yum-fastestmirror
  sudo rpm --import http://dnmouse.org/RPM-GPG-KEY-dnmouse
  sudo yum -y --nogpgcheck install http://dnmouse.org/autoplus-1.2-2.noarch.rpm
  //Add Google Repository
  wget https://dl-ssl.google.com/linux/linux_signing_key.pub
  sudo rpm --import linux_signing_key.pub  
  // Add Adobe Repository to yum
  rpm -ivh http://linuxdownload.adobe.com/adobe-release/adobe-release-i386-1.0-1.noarch.rpm
  rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux
  ## English version ##
  yum install nspluginwrapper.i686 AdobeReader_enu
  ## Check other language versions with following command ##
  yum list AdobeReader*
#apache
  sudo yum -y install httpd //Apache Install
  sudo /etc/init.d/httpd start //Start Apache 
  sudo pgrep httpd 
  sudo chkconfig httpd on //set startup command for the installed softwares at system startup
#mysql
  sudo yum -y install mysql mysql-server mysql-workbench phpMyAdmin p7zip p7zip-plugins unrar ant-contrib  
  #mysql configuration
  sudo service mysqld start
  sudo mysqladmin -u root password root
  sudo chkconfig mysqld on //Set mysqld to be started on restart
./githubSetup.sh
#User Configuration
  sudo useradd -g users www
  sudo chown -R www:users /home/www
  sudo chmod -R 755 /home/www
  sudo yum -y install vsftpd
  sudo useradd ftpwordpress -d /home/www/html/wordpress
  sudo passwd ftpwordpress
#install RVM
sudo bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
sudo yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel
#sudo cp -f ~/code/Code/httpd.conf /etc/httpd/conf
  #sudo cp -f /media/Joe/backup/mahinthjoe/code/Code/httpd.conf /etc/httpd/conf/
#Install Very Secure FTP & configure
 sudo vi /etc/vsftpd/vsftpd.conf #configure vsftpd.conf Set Anonymous_Enable=NO
 sudo /etc/init.d/vsftpd start
 sudo chkconfig vsftpd on
 sudo setsebool -P allow_ftpd_full_access 1 #to allow SELinux access by vsftpd to home directory

#install wordpress/ in /home/www/html before proceding Download latest.tar.gz from wordpress.org
#sudo tar -xf latest.tar.gz -C /home/www/html/
#edit wp-config.php in wordpress/
#sudo mv /home/www/html/wordpress/wp-config-sample.php /home/www/html/wordpress/wp-config.php
#Set Database Username password database in wp-config.php

 sudo mkdir /home/www/html/meltronicsgroup/wp-content/upgrade
 sudo mkdir /home/www/html/meltronicsgroup/wp-content/uploads
 
//Required for theme & plugin install via wordpress controlpanel
 sudo chmod -R 777 /home/www/html/wordpress/wp-content/upgrade
 sudo chmod -R 777 /home/www/html/wordpress/wp-content/uploads
 sudo chmod -R 777 /home/www/html/wordpress/wp-content/themes      
 sudo chown apache:apache /home/www/html/wordpress/wp-content/themes      
 sudo chown apache:apache /home/www/html/wordpress/wp-content/uploads
 sudo chown apache:apache /home/www/html/wordpress/wp-content/upgrade


#Permissions and SELinux Configuration
#semanage fcontext -a -t httpd_sys_content_t "/home/www/html(/.*)?"//to add a file context of type httpd_sys_content_t for everything under /home/www/html.  
chcon -t execmem_exec_t '/opt/Adobe/Reader9/Reader/intellinux/bin/acroread' // To correct chcon -t execmem_exec_t '/opt/Adobe/Reader9/Reader/intellinux/bin/acroread' making program stack executable
#sudo chcon -R -h -t httpd_sys_content_t  /home/www
#sudo chcon -h -t httpd_sys_script_exec_t /home/www/cgi-bin
#sudo setsebool -P httpd_can_network_relay 1
#sudo setsebool -P allow_ypbind 1
#If you want to allow httpd to have write access on the .htaccess file
#Then you need to change the label on '/home/www/html/wordpress/.htaccess'
#Do
sudo semanage fcontext -a -t httpd_sys_rw_content_t '/home/www/html/wordpress/.htaccess'
sudo restorecon -v '/home/www/html/wordpress/.htaccess'
#SELinux enable write to .htaccess by httpd process
sudo emanage fcontext -a -t httpd_sys_rw_content_t '.htaccess'
sudo restorecon -v '.htaccess'
sudo setsebool -P allow_ypbind 1 #enable wordpress update via Wordpress Control Panel ftp
semanage fcontext -a -t httpd_sys_rw_content_t '/home/www/html/wordpress/wp-content/uploads/2011/09' //To have httpd write access on specified directory
restorecon -v '/home/www/html/wordpress/wp-content/uploads/2011/09' //for httpd to have write access 
sudo rpm -vhi adobe-release-i386-1.0-1.noarch.rpm
sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux
sudo yum install -y ld-linux.so.2 gtk2-devel.i686 libdbus-glib-1.so.2 libhal.so.1 rpm-devel.i686 libXt.so.6 gnome-keyring-devel.i686 libDCOP.so.4 libxml2-devel.i686 nss-devel.i686 libxslt.i686 xterm rpm-build

