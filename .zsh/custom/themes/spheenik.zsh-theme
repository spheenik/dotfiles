local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

local user_name=$(whoami)

local user_col="%{$fg[yellow]%}"
if [[ "$user_name" = "root" ]]; then
	user_col="%{$fg[red]%}"
fi

local prompt_user=""
if [[ -n "$SSH_CLIENT" || "$user_name" != "spheenik" ]]; then
	prompt_user="${user_col}${user_name}"
fi

local prompt_host=""
if [[ -n "$SSH_CLIENT" ]]; then
	prompt_host="%{$fg[white]%}@${user_col}$(hostname -s)"
fi

local separator=""
if [[ -n "$prompt_user" || -n "$prompt_host" ]]; then
	separator=" "
fi

PROMPT='${ret_status} ${prompt_user}${prompt_host}${separator}%{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# vim: filetype=sh ts=4 sw=4
