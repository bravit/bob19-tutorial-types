# A tutorial on type-level programming in Haskell


## Setup

Please, run the following commands before coming to this course:

```
git clone https://github.com/bravit/bob19-tutorial-types
cd bob19-tutorial-types
stack setup
stack build # this step could take a while 
stack install doctest
```

If everything goes well, the following command should be successful:

```
$ stack exec -- doctest 0-intro.hs
Examples: 5  Tried: 5  Errors: 0  Failures: 0
```

That's it!  You are ready for the tutorial.

If you are having difficulties getting this far, please check that
your local repository is in sync with github, then open an issue.