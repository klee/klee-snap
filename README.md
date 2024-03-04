<h1 align="center">
  <img src="http://klee.github.io/images/klee.svg" alt="KLEE">
  <br />
  KLEE
</h1>

<p align="center"><b>This is the snap for KLEE</b>, <i>Symbolic Execution Engine</i>. It works on Ubuntu, Fedora, Debian, and other major Linux
distributions.</p>

<p align="center">
<a href="https://snapcraft.io/my-snap-name">
  <img alt="enpass" src="https://snapcraft.io/klee/badge.svg" />
</a>
<a href="https://snapcraft.io/my-snap-name">
  <img alt="enpass" src="https://snapcraft.io/klee/trending.svg?name=0" />
</a>
</p>


## Install

    sudo snap install klee

All klee commands can be used with the `klee.` prefix (e.g. `klee.ktest-gen`). Commands that contained the `klee-<command>` prefix were simply renamed to `klee.<command>` (e.g. `klee-zesti` becomes `klee.zesti`).

This snap also includes two convenience scripts:

 - `klee.run <testcase> <command...>` which can be used to run a testcase. It will setup all the necessary variables for you.
 - `klee.env [CFLAGS|LDFLAGS]` which outputs the flags needed to build or link a program against klee.

An example of its usage, following the [first tutorial](http://klee.github.io/tutorials/testing-function/) could be:

```
$ clang $(klee.env CFLAGS) -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone get_sign.c
$ klee get_sign.bc
KLEE: output directory = "klee-out-0"

KLEE: done: total instructions = 33
KLEE: done: completed paths = 3
KLEE: done: partially completed paths = 0
KLEE: done: generated tests = 3
$ klee.ktest-tool klee-last/test000001.ktest
ktest file : 'klee-last/test000001.ktest'
args       : ['get_sign.bc']
num objects: 1
object 0: name: 'a'
object 0: size: 4
object 0: data: b'\x00\x00\x00\x00'
object 0: hex : 0x00000000
object 0: int : 0
object 0: uint: 0
object 0: text: ....
$ gcc $(klee.env CFLAGS) $(klee.env LDFLAGS) get_sign.c
$ klee.run klee-last/test000001.ktest ./a.out
$ echo $?
0
```

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-white.svg)](https://snapcraft.io/klee)

([Don't have snapd installed?](https://snapcraft.io/docs/core/install))

