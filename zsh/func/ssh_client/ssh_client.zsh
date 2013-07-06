# ssh_client
# Detects if shell is accessed through ssh


if [[ -n "$SSH_CLIENT" ]] ; then ssh_client="[SSH]"

fi
