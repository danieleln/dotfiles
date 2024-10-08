#!/usr/bin/env fish

function dvar --description="manipulate dvars"

  argparse --name='dvar' 'h/help' 'd/default' 'e/erase' 'q/query' -- $argv
  or return

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

  # Look for the name of the variable
  if test (count $argv) -eq 0
    echo "Variable name is missing. See `dvar --help`."
    return 1
  end

  set -l DVAR_NAME "$argv[1]"
  set -l DVAR_PREFIX "DVAR_"

  # Prepend DVAR_PREFIX to the variable name if missing
  if not string match -r "^$DVAR_PREFIX+" "$DVAR_NAME" > /dev/null
    set DVAR_NAME "$DVAR_PREFIX$DVAR_NAME"
  end

  # Erase the variable
  if set -q _flag_erase
    if set -q $DVAR_NAME
      set -e $DVAR_NAME
      return 0
    end

    echo "Variable `$DVAR_NAME` is not defined."
    return 1
  end

  # Check if variable $DVAR_NAME is defined
  if set -q _flag_query
    if set -q "$DVAR_NAME"
      return 0
    end

    return 1
  end

  # Read the value of variable $DVAR_NAME
  if test (count $argv) -eq 1
    eval "echo \$$DVAR_NAME"
    return 0
  end

  # If there is the default flag and the variable exists already, do nothing
  if set -q _flag_default; and set -q "$DVAR_NAME"
    return
  end

  # Set the variable
  set -Ux "$DVAR_NAME" $argv[2..(count $argv)]

end

