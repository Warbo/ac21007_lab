Lab 2: Haskell
======================================

These lab exercises are provided as a cabal package. All the necessary commands
are listed in these instructions and if you have used any command line
package/project management utility before these should be familiar.
You do not need any further knowledge of Cabal. However, if you want to know
more please refer to Cabal User Guide:

```
https://www.haskell.org/cabal/users-guide/
```

In particular to chapters 'Introduction' and 'Building, installing and managing
packages'.


Please either use a Linux machine in the Lab 2 or the Haskell Platform you have
installed on your machine.  Yet again, as the versions of GHC and cabal vary
please pay attention to the instructions.


1. Update your local copy of this repository:

    ```
    $ git pull
    $ cd ac21007_lab/lab02
    ```

2. In Lab 2 you are provided with a package 'lab2'. This is a library of some
   basic list functions. Note that this package does not contain any executable
   binaries. Prepare your development environment by using the following
   commands:

   1. For GHC 7.6:
      Configure the package and install any missing dependencies (libraries
      that our package 'lab2' depends on)

      ```
      cabal configure
      cabal install --only-dependencies
      ```

      Now you can run your package in the GHCi:
    
      ```
      ghci src/Lab2.hs
      ```


   2. For GHC 7.8 and newer: 
      Initialise a new sandbox environment, configure the package and install
      any missing dependencies (libraries that our package 'lab2' depends on)

      ```
      cabal sandbox init
      cabal configure
      cabal install --dependencies-only
      ```

      Now you can build your package and run the GHCi:

      ```
      cabal build
      cabal repl
      ```

   
3. Source code of this package is stored in the folder './src'.  However, actual
   definitions of library functions are missing. Your task is to provide these
   definitions. Please open the file './src/Lab2.hs' and follow instructions
   there. These instructions are written using haddock (Haskell documentation
   tool) markup. You can also generate package documentation and check the
   instructions in your browser:

   ```
   cabal haddock 
   ```

   The generated documentation is stored in 'dist/doc/html/lab02/index.html'.
   Note that this time we do not need the '--executables' switch. Packages may
   contain multiple executables or libraries. By default, only library
   documentation is generated.


4. This package is also equipped with a test suite. Once you have implemented all
   the functions in the file 'src/Lab2.hs' you can run the test to see whether
   there are any problems:

   1. For GHC 7.6:
      Reconfigure your package and enable test, install any missing
      dependencies (tests may, and do, require further libraries),
      and build the package:

      ```
      cabal configure --enable-test
      cabal install --only-dependencies
      cabal build
      ```

      Now run the test suite:

      ```
      $ cabal test
      Running 1 test suites...
      Test suite lab2-test: RUNNING...
      Test suite lab2-test: PASS
      Test suite logged to: dist/test/lab02-0.1.0.0-lab2-test.log
      1 of 1 test suites (1 of 1 test cases) passed.
      ```


   2. For GHC 7.8 and newer: 
      Reconfigure your package and enable test, install any missing
      dependencies (tests may, and do, require further libraries),
      and build the package:

      ```
      cabal configure --enable-tests
      cabal install --dependencies-only
      cabal build
      ```

      Now run the test suite:

      ```
      $ cabal test
      Test suite lab2-test: RUNNING...
      Test suite lab2-test: PASS
      Test suite logged to: dist/test/lab02-0.1.0.0-lab2-test.log
      1 of 1 test suites (1 of 1 test cases) passed.
      ```



5. If you have implemented all the functions correctly you will see the 'PASS'
   result. Otherwise, you can see a test log that states why a test of
   particular function failed. The log will state arguments of the failed
   function for which you implementation behaves differently than described in
   the instructions (if the test output seems confusing please feel free to
   ask!).

   If you want to fix your definitions in 'src/Lab2.hs' you do not need to
   reconfigure the whole package. Just update the file 'Lab2.hs', rebuild
   your library and re-run the test suit:

   ```
   cabal build 
   cabal test
   ```

   or, if you are using \*nix:

   ```
   cabal build && cabal test
   ```



