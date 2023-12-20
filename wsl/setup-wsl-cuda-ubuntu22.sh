# Install CUDA on WSL
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
echo "deb [signed-by=/usr/share/keyrings/cuda-archive-keyring.gpg] https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/ /" | sudo tee /etc/apt/sources.list.d/cuda-wsl-ubuntu-x86_64.list
wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-get update
sudo apt-get -y install cuda-toolkit
mkdir git && cd git
git clone https://github.com/NVIDIA/cuda-samples.git
git clone https://github.com/mahinthjoe/Code.git
git clone https://github.com/mahinthjoe/SecureAI-Tools.git
git clone https://github.com/mahinthjoe/ohmyzsh.git
cd cuda-samples/Samples/1_Utilities/deviceQuery
make
# Ensure Successful CUDA installation
./devicequery
sudo apt -y install zsh
cd ~/git/ohmyzsh/tools
sh install.sh

