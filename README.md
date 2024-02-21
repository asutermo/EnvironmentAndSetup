# System Tweaks

## WSL 

### RAM Tweaks

I needed additional RAM support for WSL, specifically ML. To do this, create a [.wslconfig](./wslconfig) file, and drop it in %USERPROFILE%. Then reboot wsl with:

```powershell
wsl --shutdown
```

### Docker Tweaks

I didn't want to use Docker Desktop, and chose to use docker exclusively in my WSL distro. To avoid having to ```sudo dockerd``` every time and eating and instance, You can place the [wsl.conf](./wsl.conf) file in /etc/ and this will start it once wsl is initialized. If I recall this will only fire once.

## ML

Here's an environment that works pretty well for most of the present HuggingFace and LyCORIS libraries. This has not been tested with StableCascade or LyCORIS 2.1. You'll need to install Anaconda.

```bash
wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh
bash ./Anaconda3-2023.09-0-Linux-x86_64.sh
```