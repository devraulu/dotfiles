set -g fish_right_prompt
set -l user_host ' '
set user_host " $USER@"(hostname -s)':'
