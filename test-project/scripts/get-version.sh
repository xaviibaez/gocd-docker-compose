#!/usr/bin/env bash
set -o errexit

function get_version() {
    local current_dir
    current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    # shellcheck source=scripts/maven-builder.sh
    source "${current_dir}"/maven-builder.sh

    if [[ ! -f ${current_dir}/../version ]]; then
        pushd "${current_dir}"/.. > /dev/null
            maven_command \
                -q \
                org.apache.maven.plugins:maven-help-plugin:3.2.0:evaluate \
                -Dexpression=project.version \
                -Doutput=version    \
                 > /dev/null

            sed -i.original "s/+BUILDNUMBER/+${GO_PIPELINE_COUNTER:-BUILDNUMBER}/" version
            rm version.original
        popd > /dev/null
    fi

    cat "${current_dir}"/../version
}
