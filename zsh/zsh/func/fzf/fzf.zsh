# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    awsprofile)   fzf --preview "grep -i -A 5 '\[profile {}\]' $AWS_CONFIG_FILE" "$@" ;;
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    kubecontext)  fzf --preview 'kubectl config get-contexts {}' "$@" ;;
  esac
}
