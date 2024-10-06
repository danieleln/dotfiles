#!/usr/bin/env fish


# Set a universal environment variable if not already defined.
# NOTE: variable names are automatically prefixed with "DVAR_", to
#       easily recognise them and not to override existing variables
function d_env_var
    set -l VAR_NAME "DVAR_$argv[1]"
    set -l DEFAULT_VALUE $argv[2]

    if not set -q $VAR_NAME
        set -U $VAR_NAME $DEFAULT_VALUE
    end
end



####################
# System variables #
####################

# Operating System ID
d_env_var SYS_OS_ID (awk -F= '/^ID=/ {print $2}' /etc/os-release | tr -d '"')



####################
# User Directories #
####################

d_env_var USR_DIR_WORK     "$HOME/work"
d_env_var USR_DIR_PERSONAL "$HOME/personal"
d_env_var USR_DIR_PROJECTS "$USR_DIR_PERSONAL/projects"
d_env_var USR_DIR_DOTFILES "$USR_DIR_PROJECTS/dotfiles"

mkdir -p $USR_DIR_WORK $USR_DIR_PERSONAL $USR_DIR_PROJECTS $USR_DIR_DOTFILES



##################
# User Variables #
##################

d_env_var USR_FASTFETCH_LOGO "$HOME/.config/fastfetch/ascii-distro-logos/$DVAR_SYS_OS_ID"
