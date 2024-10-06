%color-format 6h
#!/usr/bin/fish

set -U fish_color_normal {foreground}
set -U fish_color_command {color_07}
set -U fish_color_param {color_04}
set -U fish_color_redirection {color_12}
set -U fish_color_comment {background:30:foreground}
set -U fish_color_error {color_02}
set -U fish_color_escape {color_06}
set -U fish_color_operator {color_06}
set -U fish_color_end {color_13}
set -U fish_color_quote {color_03}
set -U fish_color_autosuggestion 555 {color_09}
set -U fish_color_user {color_11}

set -U fish_color_host {foreground}
set -U fish_color_valid_path --underline
set -U fish_color_cwd {color_03}
set -U fish_color_cwd_root {color_02}
set -U fish_color_match --background={color_13}
set -U fish_color_search_match {color_12} --background={background:85:foreground}
set -U fish_color_selection {color_08} --bold --background={background:85:foreground}
set -U fish_color_cancel -r
set -U fish_pager_color_prefix {color_08} --bold --underline
set -U fish_pager_color_completion

set -U fish_pager_color_description {color_03} {color_04}
set -U fish_pager_color_progress {color_16} --background={color_07}
set -U fish_color_history_current --bold
