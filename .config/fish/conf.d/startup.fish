# Initializes starship prompt
function starship_transient_prompt_func
  starship module character
end
starship init fish | source
enable_transience


# Initializes zoxide
zoxide init --cmd cd fish | source


# Loads chromasync color palette
source "$HOME/.cache/chromasync/out/chromasync-fish.fish"
