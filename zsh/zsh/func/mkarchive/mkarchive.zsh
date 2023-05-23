# Make archive

# Create an archive from given directory
function mktar() {
  tar cvf  "${1%%/}.tar"     "${1%%/}/";
}

function mktgz() {
  tar cvzf "${1%%/}.tar.gz"  "${1%%/}/";
}

function mktbz() {
  tar cvjf "${1%%/}.tar.bz2" "${1%%/}/";
}

function mktxz() {
  tar cf - "$1" | xz -4e > "$1".tar.xz 
}
