# Update DNF Configuration
sudo gnome-text-editor /etc/dnf/dnf.conf
#Add Below Text and Save
	max_parallel_downloads=10
	fastestmirror=True
sudo dnf -y update && sudo dnf -y upgrade
# Restart because above command will change the currently running kernel module from 6.5.6-300.fc39.x86_64 to 6.6.11-200.fc39.x86_64 after Restart
# Check is UEFI Secure Boot Enabled or Disabled
mokutil --sb-state # Should output SecureBoot enabled
# Verify You Have a Supported Version of Linux
uname -m && cat /etc/*release # You should see output similar te x86_64
# Verify You Have a CUDA-Capable GPU
lspci | grep -i nvidia # Ouput depending upon your Configuration
#04:00.0 VGA compatible controller: NVIDIA Corporation GAXXX [GeForce RTX XXXX Lite Hash Rate] (rev a1)
#04:00.1 Audio device: NVIDIA Corporation GAXXX High Definition Audio Controller (rev a1)
#Detect Display Driver
loginctl show-session $(awk '/tty/ {print $1}' <(loginctl)) -p Type | awk -F= '{print $2}'
# Verify System has gcc installed
gcc --version # If Output bash: gcc: command not found...  install below in Fedora
sudo dnf -y group install "C Development Tools and Libraries" "Development Tools"
# kernel development tools and kernel headers 
sudo dnf -y install kernel-devel kernel-headers gcc make dkms acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig
# The kernel headers and development packages for the currently running kernel
# sudo dnf install kernel-devel-$(uname -r) kernel-headers-$(uname -r)
# CMake build environment generator
sudo dnf -y install cmake

# Download Nvidia Driver for your Card
wget https://in.download.nvidia.com/XFree86/Linux-x86_64/535.154.05/NVIDIA-Linux-x86_64-535.154.05.run
chmod a+x ./NVIDIA-Linux-x86_64-535.154.05.run 
# Install openssl in Fedora
sudo dnf install openssl
# Preparing the Public/Private Keys
cd $home 
mkdir -p bin/drivers && cd bin/drivers
openssl req -new -x509 -newkey rsa:2048 -keyout /home/$USER/bin/drivers/Nvidia.key -outform DER -out /home/$USER/bin/drivers/Nvidia.der -nodes -days 100000 -subj "/CN=Graphics Drivers"
$ sudo mokutil --import /home/$USER/bin/drivers/Nvidia.der
#As mentioned in link1 by itpropmn07:

#    “This command requires you create password for enrolling. Afterwards, reboot your computer, in the next boot, the system will ask you enroll, you enter your password (which you created in this step) to enroll it.”

#Read more: https://sourceware.org/systemtap/wiki/SecureBoot”
# Manual NVIDIA Driver Install Disabling Nouveau Drivers in Fedora
## Install dependencies
dnf install kernel-devel kernel-headers gcc make dkms acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig

## blacklist nouveau
echo -e "blacklist nouveau\noptions nouveau modeset=0" | sudo tee /etc/modprobe.d/blacklist-nouveau.conf

## edit /etc/default/grub
GRUB_CMDLINE_LINUX="rhgb quiet rd.driver.blacklist=nouveau nvidia-drm.modeset=1"

## Update grub2
grub2-mkconfig -o /boot/grub2/grub.cfg

## remove old package
dnf -y remove xorg-x11-drv-nouveau

## Backup old initramfs nouveau image 
mv /boot/initramfs-$(uname -r).img /boot/initramfs-$(uname -r)-nouveau.img
## Create new initramfs image ##
dracut /boot/initramfs-$(uname -r).img $(uname -r)
systemctl set-default multi-user.target

# After reboot in a multi-user.target mode, we can install NVIDIA Driver
sudo ./NVIDIA-Linux-x86_64-535.154.05.run 
--module-signing-secret-key=/home/$USER/bin/drivers/Nvidia.key 
--module-signing-public-key=/home/$USER/bin/drivers/Nvidia.der

# Once the installer script finishes, we reboot again with the graphical.target 
sudo systemctl set-default graphical.target
sudo reboot

