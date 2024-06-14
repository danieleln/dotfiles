#!/usr/bin/env fish

# {{ list abbr }}
# Replaces the normal ls command with exa
function list --description "`ls` on steroids"
    clear
    exa -1F --group-directories-first -s=extension --icons --color=always --ignore-glob=".git" $argv
end

# Common ls abbreviations
abbr --add l  list     # list
abbr --add ls list     # list
abbr --add ll list -l  # list long
abbr --add la list -la # list all
abbr --add lt list -T  # list tree



# {{ clear abbr }}
abbr --add c  "clear"
abbr --add cl "clear"



# {{ cp, mkdir, rm abbr }}
abbr --add mv    "mv -i"       # Prompts before overwriting existing files
abbr --add cp    "cp -ri"      # Copies the content of directories recursively
                               # and prompts before overwriting existing files

abbr --add mkdir "mkdir -p"    # Builds also missing parent directories
abbr --add mk    "mkdir -p"    # Builds also missing parent directories

abbr --add rmrf  "rm -rf"      # Removes recursively without prompting
abbr --add rm    "rm -I"       # Interactive, prompts once before removing
                               # more than three files



# {{ cat abbr }}
abbr --add cat    "batcat"
abbr --add icat   "kitten icat"



# {{ neovim abbr }}
abbr --add vim "nvim"
abbr --add vi  "nvim"



# {{ git abbr }}
abbr --add g   "git"
abbr --add gi  "git init"
abbr --add gs  "clear; git status"
abbr --add gl  "git log"
abbr --add ga  "git add"
abbr --add gc  "git commit"
abbr --add gp  "git push -u origin"
abbr --add gd  "git diff"
abbr --add gb  "git branch"
abbr --add gcl "git clone"
abbr --add gsw "git switch"
abbr --add gco "git checkout"
abbr --add grm "git rm"
abbr --add gmv "git mv"



# {{ parent directory abbr }}
abbr --add ..  "cd .."
abbr --add ... "cd ../.."
abbr --add .1  "cd .."
abbr --add .2  "cd ../.."
abbr --add .3  "cd ../../.."
abbr --add .4  "cd ../../../.."
abbr --add .5  "cd ../../../../.."
abbr --add .6  "cd ../../../../../.."
abbr --add .7  "cd ../../../../../../.."



# {{ exit abbr }}
abbr --add exit "exit 0"
abbr --add quit "exit 0"
abbr --add q    "exit 0"




# {{ arduino-cli }}
abbr --add ino "arduino-cli"



# {{ stow }}
abbr --add stow-dotfiles "stow --target=$HOME/ --dir=$HOME/workspace/projects/repos/dotfiles/ ."



# {{ chromasync }}
abbr --add cs "chromasync"



# {{ miscellaneous }}
abbr --add matrix "cmatrix"
abbr --add nf     "clear; neofetch"

abbr --add config "cd ~/.config"
abbr --add conf   "cd ~/.config"

abbr --add themes "kitten themes"
abbr --add theme  "ranger ~/workspace/wallpapers/ --cmd=\"map <enter> shell -f ~/workspace/wallpapers/setw %d/%f\""
