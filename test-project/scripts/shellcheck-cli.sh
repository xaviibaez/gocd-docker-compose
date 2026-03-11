#!/usr/bin/env bash

function shellcheck_command() {
    # koalaman/shellcheck:v0.8.0
    docker run \
           --tty                    \
           --rm                     \
           -v "${PWD}":"${PWD}"     \
           -w "${PWD}"              \
           -u "$(id -u)":"$(id -g)" \
           -e HOME="${PWD}"         \
           koalaman/shellcheck@sha256:4c4427336d2b4bdb054a1e97396fa2e9ca0c329a1f43f831b99bcaae4ac24fcd \
           --color=always           \
           --format=tty             \
           -x                       \
           "$@"
}
