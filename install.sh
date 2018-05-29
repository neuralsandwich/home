#!/usr/bin/env bash

PREFIX=""
FILES=()

abort() {
        local message=$1

        echo "[ERROR] $message" >&2 \
                && exit 1
}

parse_args() {
        while getopts ":l:p:r" opt; do
                case $opt in
                        l)
                                FILES+=("$OPTARG")
                                ;;
                        p)
                                PREFIX=$OPTARG
                                ;;
                        r)
                                abort "TODO: uninstall"
                                ;;
                        \?)
                                abort "Invalid option: -$OPTARG"
                                ;;
                        :)
                                abort "Option -$OPTARG requires an argument."
                                ;;
                esac
        done
        if [ $OPTIND -eq 1 ]; then
                abort "No options were passed";
        fi
}

install() {
        local prefix=$1
        local file=$2
        $(test $file \
                && ln -sf $(readlink -f $file) $prefix$file) \
                || abort "'$file' does not exist, cannot install"
}

main() {
        parse_args $@
        for file in "${FILES[@]}" ; do
               install $PREFIX $file
        done
}

main $@
