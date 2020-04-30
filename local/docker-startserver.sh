#!/usr/bin/env bash
set -e
pushd . > /dev/null
cd $(dirname ${BASH_SOURCE[0]})
ROOT_DIR=$(realpath -e "$(pwd)/..")
source ./.env
popd > /dev/null

function startserver() {
    docker run -d --name "${PROJECT_NAME}-server" -v ${ROOT_DIR}/public:/usr/share/nginx/html:ro -p ${NGINX_PORT}:80 ${NGINX_IMAGE}
    echo "Server nginx running at"
    echo " => http://localhost:${NGINX_PORT}"
}

if [ "${BASH_SOURCE[0]}" == "$0" ]; then
    startserver
fi