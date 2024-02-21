#!/bin/sh

# WSL2 should come preloaded with some semblance of nvidia installed (if using nvidia GPU). Verify with 'nvidia-smi' command. If that fails or seg faults, install the proper driver for Windows (this will come with the components needed for WSL2).

# Links
# [WSL2](https://learn.microsoft.com/en-us/windows/ai/directml/gpu-cuda-in-wsl)
# [Nvidia Driver](https://developer.nvidia.com/cuda-11-7-1-download-archive?target_os=Linux&target_arch=x86_64&Distribution=WSL-Ubuntu&target_version=2.0&target_type=deb_local)

# Install Cuda
wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.7.1/local_installers/cuda-repo-wsl-ubuntu-11-7-local_11.7.1-1_amd64.deb
sudo dpkg -i cuda-repo-wsl-ubuntu-11-7-local_11.7.1-1_amd64.deb
sudo cp /var/cuda-repo-wsl-ubuntu-11-7-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda

# Setup for some ML stuff (bitsandbytes)
wget https://raw.githubusercontent.com/TimDettmers/bitsandbytes/main/install_cuda.sh
bash install_cuda.sh 117 ~/local 1 

# Set paths
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/asutermo/local/cuda-11.7/lib64' >> ~/.bashrc
echo 'export PATH=$PATH:/home/asutermo/local/cuda-11.7/bin' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/lib/wsl/lib:$LD_LIBRARY_PATH' >> ~/.bashrc
