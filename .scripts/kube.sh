#!/usr/bin/env bash

source /usr/local/etc/colors.sh

kube=${KUBECTL:-kubectl}

if ! type $kube &>/dev/null; then
    if [[ n"${KUBECTL}" == "n" ]]; then
        echo "${error}No ${highlight}KUBECTL${clr} specified and ${highlight}kubectl${clr} binary doesn't exist. Are you using microk8s? - You should specify ${highlight}KUBECTL${clr} env var" >&2
        exit 1
    fi
    echo "${error}KUBECTL contains invalid binary. Is ${highlight}${kube}${clr} an alias?" >&2
    exit 1
fi
