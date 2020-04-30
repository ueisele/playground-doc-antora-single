#!/usr/bin/env bash
set -e
pushd . > /dev/null
cd $(dirname ${BASH_SOURCE[0]})
ROOT_DIR=$(realpath -e "$(pwd)/..")
source ./.env
popd > /dev/null

function generate() {
    docker run --rm --name "${PROJECT_NAME}-generate" -u $(id -u) -v ${ROOT_DIR}:/workspace -w /workspace ${NODE_IMAGE} bash -c "npm install && npm run generate"
}

function restartserver() {
    docker restart "${PROJECT_NAME}-server" 2&> /dev/null || true
}

if [ "${BASH_SOURCE[0]}" == "$0" ]; then
    generate
    restartserver
fi