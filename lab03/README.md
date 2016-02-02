Lab 3: Haskell
======================================

These lab exercises are provided as a cabal package. All the necessary commands
have been introduced in previous labs, please refer to these.

Please either use a Linux machine in the Lab 2 or the Haskell Platform you have
installed on your machine.  Yet again, as the versions of GHC and cabal vary
please pay attention to the instructions.


1. Update your local copy of this repository using `git pull`. In case of any
   local conflicts use git commands `git add` and `git commit`. Please refer to 
   documentation if needed.

   Alternatively you can git clone a completely new version of this repository
   using the `git clone` command a in the Lab 1.


2. In Lab 3 you are provided with a package 'lab3'. Yet again this is a library
   of some (list) functions. Note that this package does not contain any
   executable binaries. Prepare your development environment:

   1. For GHC 7.6:
      Configure the package and install any missing dependencies (use the
      `--only-dependecies` option)

      Now you can load your package into GHCi the usual way:
    
      ```
      ghci src/Lab3.hs
      ```


   2. For GHC 7.8 and newer: 
      Initialise a new sandbox environment, configure the package and install
      any missing dependencies (use the `--dependencies-only` option.

      Now you can build your package and load it into GHCi:

      ```
      cabal build
      cabal repl
      ```

   
3. Source code of this package is stored in the folder './src'.  However, actual
   definitions of library functions are missing. Your task is to provide these
   definitions. Please open the file './src/Lab3.hs' and follow instructions
   there. Yet again, generating Haddock documentation and opening it in a web
   browser might be helpful.
   
4. This package is equipped with a test suite. Once you have implemented all
   the functions in the file 'src/Lab3.hs' you can run the test to see whether
   there are any problems. The particular commands for doing so are very same
   as in the last lab, reconfigure your package while enabling the test suite
   (use `--enable-test` option), install any further dependencies that are
   required by the test suite, and build your package.


   Now you can run the test suite:

    ```
    $ cabal test
    Running 1 test suites...
    Test suite lab2-test: RUNNING...
    Test suite lab2-test: PASS
    Test suite logged to: dist/test/lab03-0.1.0.0-lab3-test.log
    1 of 1 test suites (1 of 1 test cases) passed.
    ```

5. If you have implemented all the functions correctly you will see the 'PASS'
   result. Otherwise, you can see a test log that states why a test of
   particular function failed. The log will state arguments of the failed
   function for which your implementation behaves differently than described in
   the instructions (if the test output seems confusing please feel free to
   ask!).



