export CVSROOT=":ext:seanj@taurus:/var/lib/prismcvs"

# Get hostname
function box_name() {
  hostname -s
}

# Display if shell is ssh
if [[ -n "$SSH_CLIENT" ]] ; then ssh_client='[SSH]'
fi

# Prompt
PS1='\n\u@\h$ssh_client\w
$ '
