# Set the tab title, shown in the tab bar by kitty

# NOTE: This function must be run manually one time per each fish process
#       (see `../conf.d/startup.fish`). Then, it listens for the variable
#       $PWD and it automatically updates the tab title whenever $PWD
#       changes
function set_terminal_tab_title --on-variable PWD

  # Icons
  set -l DIR_ICON "\033[2m󰉖 \033[22;1m"
  # set -l DIR_ICON "\033[2m󰉋 \033[22;1m"
  set -l GIT_ICON "\033[2m \033[22;1m"
  set -l SINGLE_DIR_SEPARATOR "\033[2m/\033[22;1m"
  set -l MULTI_DIR_SEPARATOR "\033[2m/󰇘/\033[22;1m"


  # The default tab title is just the current directory
  set -l cur_dir   (basename $PWD)
  set -l tab_title "$DIR_ICON$cur_dir"


  # When inside a git repo, make sure to include the repo name
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1

    # Get the path to the repo home directory
    set -l repo_path (git rev-parse --show-toplevel)
    # Extract just the repo name and prepend the git icon
    set -l repo_name "$GIT_ICON"(basename "$repo_path")


    # Adjust the tab title depeding on the current directory
    if test "$PWD" = "$repo_path"
      # Set the tab title just to the repo name
      set tab_title "$repo_name"

    else if test "$PWD" = "$repo_path/$cur_dir"
      # Append the current directory after the repo name
      set tab_title "$repo_name""$SINGLE_DIR_SEPARATOR""$cur_dir"

    else
      # Append the current directory after the repo name Note that, in
      # this third case, there must be at least one directory nested
      # between the repo base directory and the current directory
      set tab_title "$repo_name""$MULTI_DIR_SEPARATOR""$cur_dir"
    end

  end


  # Set the tab title
  printf "\e]2;$tab_title\a"
end
