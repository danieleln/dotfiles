@fmt: hex
#!/usr/bin/env fish

set -U fish_color_normal {FG}
set -U fish_color_command {CYN}
set -U fish_color_param {YLW}
set -U fish_color_redirection $fish_color_param
set -U fish_color_comment {BG:30:FG}
set -U fish_color_error {RED}
set -U fish_color_escape {MAG}
set -U fish_color_operator $fish_color_escape
set -U fish_color_end 3878aa
set -U fish_color_quote {GRN}
set -U fish_color_autosuggestion 555 brblack
set -U fish_color_user brgreen

set -U fish_color_host $fish_color_normal
set -U fish_color_valid_path --underline
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_match --background=brblue
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_cancel -r
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_completion

set -U fish_pager_color_description $fish_color_quote yellow
set -U fish_pager_color_progress brwhite --background=cyan
set -U fish_color_history_current --bold
