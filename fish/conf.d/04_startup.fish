# Initializes starship prompt
starship init fish | source

# Enable starship transient prompt (see https://starship.rs/advanced-config/)
function starship_transient_prompt_func
  echo $DVAR_USR_VAR_PROMPT_SYMBOL
end
enable_transience


# Set the tab title (see ../functions/set_terminal_tab_title.fish)
set_terminal_tab_title


# Injtializes zoxide
zoxide init --cmd cd fish | source


# Loads chromasync color palette
source "$HOME/.cache/chromasync/out/chromasync-fish.fish"
