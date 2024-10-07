# Initializes starship prompt
function starship_transient_prompt_func
  starship module character
end
starship init fish | source
enable_transience


# Set the tab title (see ../functions/set_terminal_tab_title.fish)
set_terminal_tab_title


# Injtializes zoxide
zoxide init --cmd cd fish | source


# Loads chromasync color palette
source "$HOME/.cache/chromasync/out/chromasync-fish.fish"
