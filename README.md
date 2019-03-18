# A tutorial on type-level programming in Haskell

## Content

The Haskell type system is good for specifying user intentions and helping the compiler to check code correctness. Unfortunately, there is sometimes a barrier before that level where beginning Haskell programmer can read and write complex type annotations. This is often the case with such libraries as `lens` or `servant`. With this tutorial, I aim to bring participants behind that barrier. I’ll present several type-level programming tools including type families, GADTs, data kinds, and others all way down to ‘almost’ dependent types. Their description will be given together with practical examples as used in the modern Haskell libraries.

We'll discuss the following GHC extensions and the corresponding Haskell features in this tutorial:

```haskell
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE GADTSyntax #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE NoStarIsType #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE ExplicitForAll #-}
```

## Plan

0. **Introduction**
  * terms
  * types
  * kinds
  * kinds are types (aka TypeInType)

1. **Various type-level Haskell features**
  * phantom types
  * proxy types
  * type applications
  * data kinds
  * kinds polymorphism
  * type-level literals (numbers, symbols, lists)
  * type operators

2. **Generalized algebraic datatypes (GADTs)**
  * example: arithmetic expressions (from ADT to GADT)
  * example: opening and closing doors
  * an idea of types equality
  * an idea of singleton types

3. **Type families**
  * open type families
  * closed type families
  * data families
  * associated types (representing graphs)
  * injectivity problem

4. **Demystifying Servant types**
  * describing web service API at the type-level
  * tying request handlers to typed API
  * running an application with the `Warp` server
  * exploring types in use

## Setup

Please, run the following commands before coming to this course:

```
git clone https://github.com/bravit/bob19-tutorial-types
cd bob19-tutorial-types
stack setup
stack build # this step could take a while 
stack install doctest
```

If everything goes well, the following commands should be successful:

```
$ stack exec -- doctest code/0-intro.hs
Examples: 23  Tried: 23  Errors: 0  Failures: 0
```

That's it!  You are ready for the tutorial.

If you are having difficulties getting this far, please check that your local repository is in sync with github, then open an issue.