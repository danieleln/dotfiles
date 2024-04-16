@fmt: hex
#!/usr/bin/fish

set -U fish_color_normal {FG}
set -U fish_color_command {CYN}
set -U fish_color_param {YLW}
set -U fish_color_redirection {YLWH}
set -U fish_color_comment {BG:30:FG}
set -U fish_color_error {RED}
set -U fish_color_escape {MAG}
set -U fish_color_operator {MAG}
set -U fish_color_end {BLUH}
set -U fish_color_quote {GRN}
set -U fish_color_autosuggestion 555 {BLKH}
set -U fish_color_user {GRNH}

set -U fish_color_host {FG}
set -U fish_color_valid_path --underline
set -U fish_color_cwd {GRN}
set -U fish_color_cwd_root {RED}
set -U fish_color_match --background={BLUH}
set -U fish_color_search_match {YLWH} --background={BG:85:FG}
set -U fish_color_selection {WHT} --bold --background={BG:85:FG}
set -U fish_color_cancel -r
set -U fish_pager_color_prefix {WHT} --bold --underline
set -U fish_pager_color_completion

set -U fish_pager_color_description {GRN} {YLW}
set -U fish_pager_color_progress {WHTH} --background={CYN}
set -U fish_color_history_current --bold
