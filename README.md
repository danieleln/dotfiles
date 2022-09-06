# config-files
This repo contains configuration files I use in my Linux machines (a W10 desktop running Ubuntu22.04 on WSL and a laptop currently running Pop!\_OS).
At the moment, it contains configuration files for neovim, oh-my-posh and bashrc

## Folder Structure
```
src
 |___ .config               # ~/.config
        |
        |___ bashrc         # config files for ~/.bashrc
        |     |___ src
        |
        |___ nvim           # config files for neovim
        |     |___ src
        |
        |___ oh-my-posh     # config files for oh-my-posh
              |___ themes
```

## Usage
run the following commands
```
cd /tmp && \
wget https://github.com/danielectrn/config-files/archive/refs/tags/v1.1.0.tar.gz && \
tar -xf v1.1.0.tar.gz && \
chmod u+x config-files-1.1.0/src/update_config_files && \
./config-files-1.1.0/src/update_config_files && \
rm -rf config-files-1.0.1 v1.1.0.tar.gz && \
cd -
```
