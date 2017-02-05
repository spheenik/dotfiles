local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

local user_name=$(whoami)

local dir_col="%{$fg[cyan]%}"
if [[ "$user_name" = "root" ]]; then
	dir_col="%{$fg[red]%}"
fi

local prompt_user=""
if [[ -n "$SSH_CLIENT" || ("$user_name" != "spheenik" && "$user_name" != "root") ]]; then
	prompt_user="%{$fg[yellow]%}$user_name"
fi

local prompt_host=""
if [[ -n "$SSH_CLIENT" ]]; then
	prompt_host="%{$fg_bold[white]%}@%{$reset_color$fg[yellow]%}$(hostname -s)"
fi

local separator=""
if [[ -n "$prompt_user" || -n "$prompt_host" ]]; then
	separator=" "
fi

PROMPT='${ret_status} ${prompt_user}${prompt_host}${separator}${dir_col}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# vim: filetype=sh ts=4 sw=4
