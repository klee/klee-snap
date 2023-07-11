#!/bin/bash

_klee_env()
{
    local cur prev

    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}

    _expand || return 0

    case "$cur" in
    -*)
        COMPREPLY=( $( compgen -W '-h --help' -- "$cur" ))
        ;;
    *)
        COMPREPLY=( $( compgen -W 'CFLAGS LDFLAGS' -- "$cur" ))
        ;;
    esac

    return 0
} &&
complete -F _klee_env $nospace $filenames klee.env

