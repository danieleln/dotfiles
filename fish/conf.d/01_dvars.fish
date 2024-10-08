#!/usr/bin/env fish


####################
# System variables #
####################

# Operating System ID
dvar --default SYS_OS_ID (awk -F= '/^ID=/ {print $2}' /etc/os-release | tr -d '"')



####################
# User Directories #
####################

dvar --default USR_DIR_WORK     "$HOME/work"
dvar --default USR_DIR_PERSONAL "$HOME/personal"
dvar --default USR_DIR_PROJECTS "$DVAR_USR_DIR_PERSONAL/projects"
dvar --default USR_DIR_DOTFILES "$DVAR_USR_DIR_PROJECTS/dotfiles"

mkdir -p $DVAR_USR_DIR_WORK $DVAR_USR_DIR_PERSONAL $DVAR_USR_DIR_PROJECTS $DVAR_USR_DIR_DOTFILES



##################
# User Variables #
##################

dvar --default USR_FASTFETCH_LOGO "$HOME/.config/fastfetch/ascii-distro-logos/$DVAR_SYS_OS_ID"
