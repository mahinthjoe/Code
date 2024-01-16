# Update DNF Configuration
sudo gnome-text-editor /etc/dnf/dnf.conf
#Add Below Text and Save
	max_parallel_downloads=10
	fastestmirror=True
sudo dnf -y update && sudo dnf -y upgrade
# Restart because above command will change the currently running kernel module from 6.5.6-300.fc39.x86_64 to
# Check is UEFI Secure Boot Enabled or Disabled
mokutil --sb-state # Should output SecureBoot enabled
# Verify You Have a Supported Version of Linux
uname -m && cat /etc/*release # You should see output similar te x86_64
# Verify You Have a CUDA-Capable GPU
lspci | grep -i nvidia # Ouput depending upon your Configuration
#04:00.0 VGA compatible controller: NVIDIA Corporation GAXXX [GeForce RTX XXXX Lite Hash Rate] (rev a1)
#04:00.1 Audio device: NVIDIA Corporation GAXXX High Definition Audio Controller (rev a1)
# Verify System has gcc installed
gcc --version # If Output bash: gcc: command not found...  install in below in Fedora
sudo dnf -y group install "C Development Tools and Libraries" "Development Tools"
# kernel development tools and kernel headers 
sudo dnf -y install kernel-devel kernel-headers gcc make dkms acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig
# The kernel headers and development packages for the currently running kernel
# sudo dnf install kernel-devel-$(uname -r) kernel-headers-$(uname -r)

# CMake build environment generator
sudo dnf -y install cmake

