# time removed to rely on tmux tray
#PROMPT='%{$fg[yellow]%}(%T)
PROMPT='%{$fg[yellow]%}%n@%m %{$fg[green]%}%/%{$fg[yellow]%} $(git_prompt_info)
→%{$reset_color%}'
ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%})"

