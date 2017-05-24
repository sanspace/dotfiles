smiley() {
  RC=$?
  [[ ${RC} == 0 ]] && echo -e "\033[01;32m:)\033[0m" || echo -e "\033[0;31m:(\033[0m ${RC}"
}
# mcd - mkdir && cd
mcd() {
  test -d "$1" || mkdir "$1" && cd "$1"
}

# up multiple directories
# shortcut to cd ../../../
up() {
    i=0
    ups=""
        if [[ $# -eq 1 ]]; then
            j=$1
        else
            j=1
    fi
    while [[ $i -lt $j ]]; do
        ups=$ups"../"
        (( i += 1))
    done
    chdir $ups
}

# setup keys into isps
sesame() {
  cat ~/.ssh/id_rsa.pub | ssh $1 'cat >> ~/.ssh/authorized_keys'
}

