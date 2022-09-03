# config-files
this repo contains the configuration files I use in my linux machines (a W10 desktop running Ubuntu22.04 on WSL and a laptop currently running Pop!\_OS).
At the moment, it contains configuration files for neovim, oh-my-posh and bashrc

## Folder Structure
```
.config
 |
 |___ bashrc
 |     |___ src
 |
 |___ nvim
 |     |___ src
 |
 |___ oh-my-posh
       |___ src
```

## Usage
1. Download the repo and place the `.config` folder inside the home directory (it should be `~/.config`).

2. Then, add the following line
```
source "${HOME}/.config/bashrc/bashrc"
```
to the `~/.bashrc` file (or `~/.bash_profile`, `~/.profile` ecc depending on the shell) 
