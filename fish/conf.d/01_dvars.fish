#!/usr/bin/env fish

function dvar --description="manipulate dvars"

  argparse --name='dvar' --max-args=2 'h/help' 'd/default' 'e/erase' 'q/query' -- $argv
  or return

  set -l NAME "$argv[1]"
  set -l VALUE "$argv[2]"
  set -l PREFIX "DVAR_"

  # Prepend the prefix to the var name if missing
  if not string match -r "^$PREFIX+" "$NAME" > /dev/null
    set NAME "$PREFIX$NAME"
  end

  # Help message
  if set -q _flag_help
    echo -e "dvar - manipulate dvars"
    echo
    echo -e "Usage:"
    echo -e "\tdvar (-h | --help)               # Show this help menu"
    echo -e "\tdvar (-q | --query) NAME         # Check if variable \$NAME is defined"
    echo -e "\tdvar NAME                        # Read value of variable \$NAME"
    echo -e "\tdvar NAME VALUE                  # Set variable \$NAME to \$VALUE"
    echo -e "\tdvar (-d | --default) NAME VALUE # Set variable \$NAME to \$VALUE only"
    echo -e "\t                                 # if \$NAME is not defined"
    echo -e "\tdvar (-e | --erase) NAME         # Erase variable \$NAME"

    return
  end

  # Erase variable
  if set -q _flag_erase
    if set -q $NAME
      set -e $NAME
      return
    else
      echo "Variable `$NAME` is not defined."
      return 1
    end
  end

  # Check if variable $NAME is defined
  if set -q _flag_query
    set -q "$NAME"
    return
  end

  # Read the value of variable $NAME
  if test (count $argv) -eq 0
    echo "Variable name is missing. See `dvar --help`."
    return 1
  end

  # Read the value of variable $NAME
  if test (count $argv) -eq 1
    eval echo \$$NAME
    return
  end

  # If there is the default flag and the variable exists already, do nothing
  if set -q _flag_default; and set -q "$NAME"
    return
  end

  # Set the variable
  set -Ux "$NAME" "$VALUE"

end



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
