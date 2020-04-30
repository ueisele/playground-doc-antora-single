#!/usr/bin/env bash
set -e
pushd . > /dev/null
cd $(dirname ${BASH_SOURCE[0]})
source ./.env
popd > /dev/null

function stopserver() {
    docker rm -f "${PROJECT_NAME}-server"   
}

if [ "${BASH_SOURCE[0]}" == "$0" ]; then
    stopserver
fi