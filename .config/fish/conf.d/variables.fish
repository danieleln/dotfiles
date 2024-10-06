#!/usr/bin/env fish

set -l ENV_VAR_PREFIX "D_"

# Set a universal environment variable if not already defined.
# NOTE: variables are automatically prefixed with $ENV_VAR_PREFIX
function d_env_var
    set -l VAR_NAME "$ENV_VAR_PREFIX$argv[1]"
    set -l DEFAULT_VALUE $argv[2]

    if not set -q $VAR_NAME
        set -Ux $VAR_NAME $DEFAULT_VALUE
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

mkdir $USR_DIR_WORK $USR_DIR_PERSONAL $USR_DIR_PROJECTS $USR_DIR_DOTFILES
