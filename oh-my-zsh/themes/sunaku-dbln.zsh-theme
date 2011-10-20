# Git-centric variation of the "fishy" theme.
# See screenshot at http://ompldr.org/vOHcwZg

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[magenta]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}?"

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}•%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%} )"
MODE_INDICATOR="%{$fg_bold[magenta]%}<%{$reset_color%}%{$fg[magenta]%}<<%{$reset_color%}"

local user_color='green'
test $UID -eq 0 && user_color='red'

PROMPT='%{$bold_color%}$(git_prompt_status)%{$reset_color%}'\
'$(git_prompt_info)
'\
'%(!.#.>) '

PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
# RPROMPT='$(vi_mode_prompt_info) ${return_code}%{$fg[$user_color]%}%~%{$reset_color%}'
RPROMPT='${return_code}%{$fg[$user_color]%}%~%{$reset_color%}'
