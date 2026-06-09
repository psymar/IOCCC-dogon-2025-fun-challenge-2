Submission for IOCCC's 2025/dogon Fun Challenge 3
© 2026 by Samantha Howard

## The point:
This is an alteration of https://github.com/ioccc-src/winner/blob/master/2025/dogon/ to display the correct year at the bottom (2025 instead of 2026)

### Additional constraints:
I kept the same code layout, and the same restriction of the original of only using the variable 'e' and no constants or literals.

### Issues:
Some compilers, particularly Apple Clang 21.0.0 on macOS 26.5.1, apparently butcher this with even -O1 optimizations enabled.  Fortunately it seems to run fast enough at -O0.

Additionally, there is still the bug that on some systems it may not display correctly unless you pipe the output through a utility such as head or cat.

## Explanation of changes:

The original program generates 2026 as an integer and outputs it with printf formatting.

The only required change, therefore, is to prepend "~-" to this value inside the printf statement; a well-known trick for decreasing a value by one in programs with constraints such as IOCCC or code golf.

However, to keep the original shape of the source code, I then moved characters forward until I could find spots to remove two characters.

This I did by finding spots that, effectively, simplified to "-~0" as a means of getting 1 (albeit without using the literal 0), and replacing the "-~" with a "!" as "!0" is also 1.

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

Everything below this line is the

## Original author's remarks:

### A little song (and no dance)

>  What this program does is plain to see,
>  as the only one variable it uses is e.
>  No other identifiers there you'll discern,
>  except the required printf, calloc, and main.
>
>  The constant is printed, to quite a few digits,
>  yet there's none in the source, you'd better believe it.
>  Yes, "Where are the constants inside?" you may wonder,
>  No Zero, nor One, and none any other.
>
>  "What of string constants?" You might indeed ask.
>  So many printfs, they must have formats,
>  but none will you find, no there is no trick,
>  All prints are achieved by some arithmetic.
>
>  The program's a bit longer than it should be,
>  as it tries to support also big endianity.
>  Though try it does, there is a small snag,
>  there's no CCOI contest, I guess it's a bug!


### And some history

An earlier version of the entry was written more than a decade ago, and
failed to make it. The only simple simple change in the output updating
2015 to 2026 was quite a bit of a challenge, which means indeed the
level of obfuscation is considerable.

The remarks song was written a decade ago too, so, no AI chatbot was
abused, and its an entirely original work.

Indeed, the program is treading some familiar themes and there's
been the 1989/roemer entry, but it had lots more variables and
constants. I'd say this entry is the C programming constrained writing
[OuLiPo](https://en.wikipedia.org/wiki/Oulipo) inverse of Perecs [A
void](https://en.wikipedia.org/wiki/A_Void).


### A note about the layout

This was the other main change of the original. Indeed the layout is
quite extremely sparse and has to be viewed with tabstop 8, and a rather
big terminal. And then take limit at infinity :)


<!--
    Modifications to original version Copyright 2026 by Samantha Howard.  All rights reserved, I guess, whatever that means?  Does that mean anything when I'm sharing it CC-by-SA?

    I considered putting an anti-AI message here but if AI is scraping IOCCC code that's honestly more destructive

    Original version of this file Copyright © 2025-2026 by Landon Curt Noll and Leonid A. Broukhis.  All Rights Reserved.

    You are free to share and adapt this file under the terms of this license:

        Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)

    For more information, see:

        https://creativecommons.org/licenses/by-sa/4.0/

-->
