# Install Video DownloadHelper Plugin for Firefox
cd ~/Downloads
wget https://github.com/aclap-dev/vdhcoapp/releases/download/v2.0.10/vdhcoapp-2.0.10-linux-x86_64.tar.bz2
tar xf vdhcoapp-2.0.10-linux-x86_64.tar.bz2 -C ~
~/vdhcoapp-2.0.10/vdhcoapp install
# Update DNF Configuration
sudo gnome-text-editor /etc/dnf/dnf.conf
max_parallel_downloads=10
fastestmirror=True
sudo dnf -y update && sudo dnf -y upgrade
# To add the docker-ce repository
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker # To start the Docker service
sudo systemctl enable docker # To make Docker start when you boot your system
# To create the docker group and add your user
sudo groupadd docker && sudo gpasswd -a ${USER} docker && sudo systemctl restart 
docker
newgrp docker
# kernel development tools and kernel headers 
sudo dnf -y install kernel-devel kernel-headers gcc make dkms acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig
# The kernel headers and development packages for the currently running kernel
sudo dnf install kernel-devel-$(uname -r) kernel-headers-$(uname -r)
sudo dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/fedora37/x86_64/cuda-fedora37.repo
sudo dnf clean all
sudo dnf -y install cuda-toolkit-12-3
sudo dnf -y module install nvidia-driver:open-dkms
# Restart and ensure 
# Nouveau drivers are notloaded
lsmod | grep nouveau

# Installing NVIDIA VAAPI/VDPAU Drivers on Fedora [Optional]
sudo dnf -y install nvidia-vaapi-driver libva-utils vdpauinfo

# Verify You Have a Supported Version of Linux
uname -m && cat /etc/*release # You should see output similar to the following, modified for your particular system:x86_64
# Verify You Have a CUDA-Capable GPU
lspci | grep -i nvidia
# Verify System has gcc installed
gcc --version
# If No gcc found install in Fedora
sudo dnf -y group install "C Development Tools and Libraries" "Development Tools"
# CMake build environment generator
sudo dnf -y install cmake
# node 
# Install nvm https://github.com/nvm-sh/nvm#install--update-script
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc
nvm install --lts
nvm install node
nvm use --lts
# Install Visual Studio for Fedora https://code.visualstudio.com/docs/setup/linux
sudo dnf -y install snapd # Installing snap on Fedora  
sudo ln -s /var/lib/snapd/snap /snap # To enable classic snap support,
sudo snap install hello-world
sudo snap install --classic code # or code-insiders #Visual Studio Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code # or code-insiders
# Setting VS Code as the default text Editor
xdg-mime default code.desktop text/plain

sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
#Install Apache Web Server with support for https
sudo dnf install httpd mod_ssl openssl
# Setting Up SSL for phpMyAdmin
mkdir /etc/httpd/ssl && cd /etc/httpd/ssl 
# generate a self-signed SSL certificate and private key as shown
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/httpd/ssl/apache.key -out /etc/httpd/ssl/apache.crt
sudo vi /etc/httpd/conf.d/ssl.conf
SSLEngine on
SSLCertificateFile /etc/httpd/ssl/apache.crt
SSLCertificateKeyFile /etc/httpd/ssl/apache.key
sudo vi /var/www/html/phpmyadmin/config.inc.php
$cfg['ForceSSL'] = true;

sudo systemctl restart httpd
sudo systemctl start httpd 
sudo systemctl enable httpd
sudo dnf install mariadb-server
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo mysql_secure_installation
sudo dnf install php php-mysqlnd php-json php-mbstring
cd /var/www/html
sudo wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
sudo tar -xvzf phpMyAdmin-latest-all-languages.tar.gz
sudo mv phpMyAdmin-*/ phpmyadmin
sudo cp /var/www/html/phpmyadmin/config.sample.inc.php /var/www/html/phpmyadmin/config.inc.php
sudo nano /var/www/html/phpmyadmin/config.inc.php
$cfg['blowfish_secret'] = 'your_secret';

curl -s -L https://nvidia.github.io/libnvidia-container/stable/rpm/nvidia-container-toolkit.repo | \
  sudo tee /etc/yum.repos.d/nvidia-container-toolkit.repo
sudo yum install -y nvidia-container-toolkit
sudo systemctl restart docker
sudo dnf install nvtop
sudo dnf install dnf5 dnf5-plugins
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates
sudo fwupdmgr update
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf upgrade --refresh
sudo dnf groupupdate core
sudo dnf install gnome-tweak-tool
flatpak remote-modify --enable flathub
flatpak install flathub com.mattjakeman.ExtensionManager
sudo dnf install -y vlc
sudo dnf install -y steam
sudo dnf install -y transmission
sudo dnf install -y geary
sudo dnf install -y dropbox nautilus-dropbox
sudo dnf install -y unzip p7zip p7zip-plugins unrar
sudo dnf install -y 'google-roboto*' 'mozilla-fira*' fira-code-fonts
# Open Apache port in firewall
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --zone=public --add-port=443/tcp --permanent
sudo firewall-cmd --reload
# Restart Apache 
sudo systemctl restart httpd


