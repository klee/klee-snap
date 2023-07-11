#!/bin/bash

function print_help() {
    res=${1:-0}
    echo "Usage: klee.run TESTCASE COMMAND..."
    echo "Run a klee TESTCASE for COMMAND"
    echo ""
    exit $res
}

DIR="$(realpath "$( dirname -- "${BASH_SOURCE[0]}"; )/.." )"

if [ $# -lt 2 ]
then
    >&2 echo "Error: TESTCASE and COMMAND are required"
    print_help 1
fi

testcase=$1
shift
command=$1
shift

LD_LIBRARY_PATH="$DIR/lib/:$LD_LIBRARY_PATH" KTEST_FILE="$testcase" $command $@
 
