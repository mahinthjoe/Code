# Manual NVIDIA Driver Install Disabling Nouveau Drivers in Fedora
echo -e "blacklist nouveau\noptions nouveau modeset=0" | sudo tee /etc/modprobe.d/blacklist-nouveau.conf
# regenerate the initramfs image with the new blacklisting configuration to prevent the Nouveau driver from loading
sudo dracut --force
# Fedora booting into a text-based, multi-user mode instead of a graphical user interface (GUI).
sudo systemctl set-default multi-user.target
sudo reboot
