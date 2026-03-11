#!/usr/bin/env bash
set -o errexit
set -o pipefail
[[ "${DEBUG}" == 'true' ]] && set -o xtrace

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd "${CURRENT_DIR}"/..
    rm -f version
    source scripts/get-version.sh
    VERSION=$(get_version)
    readonly VERSION
    git rev-parse HEAD > commit

    source scripts/maven-builder.sh
    maven_command                                           \
        org.codehaus.mojo:versions-maven-plugin:2.10.0:set  \
        -DgenerateBackupPoms=false                          \
        -DnewVersion="${VERSION}"                           \
        clean                                               \
        package                                             \
        "$@"
popd
