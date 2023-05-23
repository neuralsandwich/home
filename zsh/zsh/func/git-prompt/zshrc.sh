# To install source this file from your .zshrc file

# Initialize colors.
autoload -U colors
colors

# Allow for functions in the prompt.
setopt PROMPT_SUBST

__GIT_PROMPT_AVAILABLE="$(hash git-prompt &> /dev/null && echo yes || echo no)"

git_prompt_available() {
    hash git-prompt &> /dev/null
}

source "${ZSH}/func/git-prompt/zshrc-gitstatus.sh"

git_prompt() {
  if [[ ${__GIT_PROMPT_AVAILABLE} == "no" ]] ; then
      echo "$(git_super_status)"
  else
      prompt=`git-prompt \
  prefix '(' \
  suffix '%{\e[1;0m%})' \
  branch '%{\e[1;35m%}' \
  separator '|' \
  staged '%{\e[0;33m%}●' \
  conflicts '%{\e[1;31m%}✖' \
  changed '%{\e[0;36m%}✚' \
  clean '%{\e[0;32m%}✓' \
  untracked '%{\e[0;31m%}…' \
  ahead '%{\e[1;0m%}↑' \
  behind '%{\e[1;0m%}↓'`

      if [ $? -eq 0 ]; then
	  echo "$prompt"
      fi
  fi
}
