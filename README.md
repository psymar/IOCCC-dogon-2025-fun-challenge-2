Submission for IOCCC's 2025/dogon Fun Challenge 2
© 2026 by Samantha Howard

## The point:
This is an alteration of https://github.com/ioccc-src/winner/blob/master/2025/dogon/ to display the correct year at the bottom (2025 instead of 2026)

### Additional constraints:
I kept the same code layout, and the same restriction of the original of only using the variable 'e' and no constants or literals.

### Issues:
The original program has some undefined behavior relating to comparing an uninitialized variable to itself.  This is patched in this repository.

There may still be the bug that on some systems it may not display correctly unless you pipe the output through a utility such as head or cat.

Additionally, there is apparently a bug on my system where if piping the output to a file, there are a number of ascii DLE (Data Link Escape) characters followed by backspaces, which are not visible when outputting to terminal.

## Explanation of changes:

The original program generates 2026 as an integer and outputs it with printf formatting.

The only required change, therefore, is to prepend `"~-"` to this value inside the printf statement; a well-known trick for decreasing an integer value by one in programs with constraints such as IOCCC or code golf.

However, to keep the original shape of the source code, I then moved characters forward until I could find spots to remove two characters.

This I did by finding spots that, effectively, simplified to `"-~0"` as a means of getting 1 (albeit without using the literal 0), and replacing the `"-~"` with a `"!"` as `"!0"` is also 1.

(Note: `-~x` is `x+1`, `~-x` is `x-1`.  Again, this only works for integers.)

Fortunately, this simple solution was effective due to the lack of identifiers with names longer than one character which could have been an issue.

Without the constraint I added of keeping the original shape of the source code, this would have been a two-character patch!

## To build:

``` <!---sh-->
    make all
```

## Try new/changed version:

``` <!---sh-->
    ./prog | cat
```

## Try original version:

``` <!---sh-->
    ./prog.orig | cat
```

## Try original version, but with UB patch:

``` <!---sh-->
    ./prog.ubfix | cat
```
