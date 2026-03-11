#!/usr/bin/env bash
set -o errexit
set -o pipefail
[[ "${DEBUG}" == 'true' ]] && set -o xtrace

function main() {
    local current_dir
    current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

    pushd "${current_dir}"/..
        source scripts/shellcheck-cli.sh

        SCRIPT_FILES=$(find . -name "*.sh" -not -path "*/target/*")
        readonly SCRIPT_FILES
        # shellcheck disable=SC2086
        shellcheck_command ${SCRIPT_FILES}
    popd
}

main
