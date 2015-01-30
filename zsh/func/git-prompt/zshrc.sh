# To install source this file from your .zshrc file

# Initialize colors.
autoload -U colors
colors

# Allow for functions in the prompt.
setopt PROMPT_SUBST

git_prompt() {
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

  if [ $? -ne 0 ]; then
    echo "Borked"
  else
    echo "$prompt"
  fi
}
