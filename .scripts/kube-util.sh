#!/usr/bin/env bash

function k.namespaceExists() {
    $kube get namespace "${1}" &>/dev/null;
}

function k.isPodRunning() {
    [[ n"$($kube get pods | grep ${1} | grep -i running)" != 'n' ]]
}

function k.waitPod() {
    if ! k.isPodRunning "${1}"; then
      echo "${info}Waiting for kubernetes pod ${highlight}${1}${clr} to be up'n'running"
      waited=0
      currentlyWaited=0
      while ! k.isPodRunning; do
        sleep 1
        waited=$(( ${waited} + 1 ))
        currentlyWaited=$(( ${currentlyWaited} + 1 ))
        if [[ ${currentlyWaited} > 15 ]]; then
          echo "${warning}Kubernetes pod ${highlight}${1}${clr} is starting for too long: ${waited} seconds"
          prompt "Is it actually up?" inverse && return 0
          prompt "Do you still want to wait?" inverse || return 1
          currentlyWaited=0
        fi
      done
  fi
}