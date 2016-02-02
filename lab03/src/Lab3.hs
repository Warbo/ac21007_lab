-- | Haskell Lab 3 exercises
--
-- In this lab you are going to need a new syntactic construction -- the @type@
-- statement. This statement introduces a synonym for a type. In the last lab
-- you have seen that 'String' is actually only such a synonym for a list of
-- 'Char's. In Haskell this is expressed by the following syntactic
-- construction:
--
-- > type String = [Char]
--
-- this construction has a form:
--
-- > type Identifier = Type
--
-- where 'Identifier' is a new name for a type beginning with a capital letter and
-- 'Type' is a monomorphic type (i.e. without type variables). These synonyms can
-- also by used with polymorphic types but we do not need to concern ourselves
-- with such a situation for now. A type synonym may be used in place of the type 
-- on right hand side of 'type' statement and conversely this type may be used
-- instead of the synonym. It servers mostly as a documentation -- we can see
-- the intended purpose of a function from its type (both in source code and in
-- Haddock). 
--
-- In this lab we are going to use a synonym for integer matrices:
--
-- > type Matrix = [[Int]]
--
-- We will understand a matrix as a list of its columns, where column in turn is
-- a list of its cells. Note that this definition does not guarantee that all
-- the lists representing columns has the same length as we would expect in case
-- of a well-formed matrix. We let solely to a programmer to make sure that
-- all functions on matrices maintain these invariant.
-- 
module Lab3 (
      partition
    , myConcat
    , myMinimum
    , subsequences
    , Matrix
    , ourMatrix
    , transposeMatrix
    , multiplyMatrix
) where

-- | Implement a function that takes a predicate a list and returns the pair 
-- of lists of elements which do and do not satisfy the predicate, respectively,
-- while keeping the relative order of elements as in the original list; e.g.:
--
-- >>> partition even [3, 10, 5, 8, 7, 9, 11]
-- ([3, 5, 7, 9, 11], [10, 8])
--
-- Note that we usually call a function with type @a -> Bool@ an (unary)
-- predicate on @a@
--
partition :: (a -> Bool) -> [a] -> ([a], [a])
partition = undefined


-- | Implement a function that concatenates all the elements of a list
-- of lists into a single list, e.g:
--
-- >>> myConcat ["Aldous", " ", "Huxley", ": ", "Brave", " ", "New World"]
-- "Aldous Huxley: Brave New World"
--
-- Please avoid using the standard 'concat' function.
--
myConcat :: [[a]] -> [a]
myConcat = undefined


-- | Define a function that returns the least element of a non-empty
-- list of integers, e,g,:
--
--
-- >>> myMinimum [4, 5, 1, 2, 3]
-- 1
--
-- Please avoid using the standard minimum function.
--
myMinimum :: [Integer] -> Integer
myMinimum = undefined

-- | Define a function that returns all non-empty subsequencies of a 
-- non-empty list. A subsequence of a list L is such a list S that can be 
-- derived from L by deleting some elements of L, e.g "hlo" is a subsequence of
-- "hello". Note that every list is a subsequence of itself (by deleting no
-- character at all).
--
-- The behaviour of 'subsequences' function should be e.g.:
-- 
-- >>> subsequences "UoD"
-- ["U","o","Uo","D","UD","oD","UoD"]
--
-- A number of occurences of a subsequence in the result list should be the same
-- as a number of different ways how to select the subsequence
--
subsequences :: [a] -> [[a]]
subsequences = undefined

-- | We define a new type alias 'Matrix' for use with the rest of functions in
-- this lab.
--
-- See the description in the module header.
type Matrix = [[Integer]]

-- | For convenience we provide a matrix:
ourMatrix :: Matrix
ourMatrix = 
    [ [ 1, 2, 0] -- column! 1
    , [ 4, 0, 0] -- column! 2
    ]

-- | Define a function that transposes a matrix, e.g.:
--
-- >>> transpose ourMatrix
-- [ [ 1, 4]
-- , [ 2, 0]
-- , [ 0, 0]
-- ]
--
transposeMatrix :: Matrix -> Matrix
transposeMatrix = undefined

-- | Define a function that returns a product of two matrices, e.g:
--
-- >>> multiplyMatrix ourMatrix (transpose ourMatrix)
-- [ [ 17, 2, 0]
-- , [  2, 4, 0]
-- , [  0, 0, 0]
-- ]
--
-- you can assume that dimensions of both the matrices are correct, i.e.
-- first of the matrices is k*l and the other one is l*m
--
multiplyMatrix :: Matrix -> Matrix -> Matrix
multiplyMatrix = undefined




