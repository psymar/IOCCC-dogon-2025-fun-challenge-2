#!/usr/bin/env bash
#
# try.ubfix.sh - demonstration of version of IOCCC's 2025/dogon with UB patched

# make sure CC is set so that when we do make CC="$CC" it isn't empty. Doing it
# this way allows us to have the user specify a different compiler in an easy way.
#
[[ -z "$CC" ]] && CC="cc"

# make sure the program has been built
#
MAKE=$(command -v gmake)
${MAKE:=make} CC="$CC" ubfix >/dev/null || exit 1

# clear the screen
#
clear

# try the program
#
read -r -n 1 -p "Press any key to run: ./prog.ubfix | head -n 20: "
echo 1>&2
echo 1>&2
./prog.ubfix | head -n 20
echo 1>&2

# try the program again
#
read -r -n 1 -p "Press any key to run: ./prog.ubfix | cat: "
echo 1>&2
echo 1>&2
./prog.ubfix | cat
echo 1>&2
