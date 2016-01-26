-- | Haskell Lab 2 exercises
--
-- In this lab exercisses you are going to need a new type - type of characters.
-- This type is called 'Char' and values of this type are single characters,
-- delimited by single quotes ('), e.g:
--
-- > 'a' 'b' 'c' ... 'A' 'B' ... '0' '1' ... '!' '?' ... '\t' '\n'
--
-- You can use characters as value pattersn in the same way you use e.g. 'True'
--
-- Note that integer zero (@0 :: Int@) and character for zero (@'0' :: Char@) are
-- two different values and __cannot__ be used interchangeably.
-- 
-- The 'String' type, which we alrady know, is in fact only and alias for a list
-- of characters, i.e. ['Char']. As such, you can use list constructors for
-- pattern matching on strings, e.g.:
-- 
-- > containsLowercaseA :: String -> Bool
-- > containsLowercaseA []      = False
-- > containsLowercaseA ('a':_) = True
-- > containsLowercaseA (_:ss)  = containsLowercaseA ss
-- 
module Lab2 (
      deletion 
    , search
    , append
    , revprefix
    , forAll
    , exists
    , insertAt
    , sortList
) where




-- | Implement a deletion function for a list of 'Char' (i. e.
-- a 'String').
--
--   The comparison operator is '=='.
--
-- The behavior of your 'deletion' function should be as follows:
--
-- >>> deletion ['a', 'b', 'c', 'd'] 'c' 
-- ['a', 'b', 'd']
--
-- >>> deletion ['a', 'b', 'c', 'c'] 'c' 
-- ['a', 'b']
--
-- >>> deletion ['a', 'b', 'c', 'c'] 'e' 
-- ['a', 'b', 'c', 'c']
--
-- Note that you can delete the dummy definition
--
-- > deletion = undefined
--
-- and provide as many of your own defining equations as needed. This 
-- holds also for the rest of the function definitions in this file.
--
deletion :: [Char] -> Char -> [Char]
deletion = undefined 


-- | Implement a search function for key-value store
--
-- A list of pairs, [('Int', 'String')], can be viewed as a key-value store.
-- A pair ('Int', 'String') associates a key of type 'Int' to a value of type 'String'.  
-- Implement a search function that returns a list of all values that are associated
-- with a given 'Int' key, e. g.: 
--
-- >>> search [(1, "University"),(2, "of"), (3, "Dundee")] 3 
-- ["Dundee"]
--
-- >>> search [(1, "University"),(2, "of"), (3, "Dundee"), (3, "Scotland")] 3 
-- ["Dundee", "Scotland"]
--
-- >>> search [(1, "University"),(2, "of"), (3, "Dundee")] 4 
-- []
--
search :: [(Int, String)] -> Int -> [String]
search = undefined


-- | Define an 'append' function
--
-- This function appends two list, e.g.:
--
-- >>> append [1, 2, 3] [4, 5] 
-- [1, 2, 3, 4, 5]
--
-- >>> append "Hello " "World!"
-- "Hello World!"
--
-- Please do not use the ('++') operator.
--
append :: [a] -> [a] -> [a]
append = undefined


-- | Define a reverse-prefix function. 
--
-- The behaviour of 'revprefix' function should be as follows:
-- 
-- >>> revprefix "abc" 'e' 
-- "cbae"
--
-- >>> revprefix "hello" 'a' 
-- "olleha"
--
-- Please do not use the append function.
revprefix :: String -> Char -> String
revprefix = undefined

-- | Define a 'forAll' function for list
--
-- The functions takes in a list and a boolean function as an argument and 
-- returns 'True' when the boolean function applied to each element of the list returns 'True',
-- otherwise the 'forAll' will return 'False', e.g.
--
-- >>> forAll even [2,4,6]
-- True
--
-- >>> forAll even [2,4,5]
-- False
--
-- where 'even' is a function is Haskell standard library (Prelude)
--
forAll :: (a -> Bool) -> [a] -> Bool
forAll = undefined


-- | Define an 'exists' function for a list
--
-- This is a counterpart to the 'forAll' function. It takes in a list and a boolean function 
-- as an argument and returns 'True' when at least one element in the list satisfies the boolean 
-- function, otherwise the 'exists' will return 'False', e.g.:
--
-- >>> exists even [3,5,7]
-- False
--
-- >>> exists even [2,5, 7]
-- True
--
exists :: (a -> Bool) -> [a] -> Bool
exists = undefined


-- | Define an 'insertAt' function 
--
-- This function inserts an element into a list at a given position, e.g.:
--
-- >>> insertAt ['a', 'b', 'c'] 'd' 0 
-- ['d', 'a', 'b', 'c']
--
-- >>> insertAt ['a', 'b', 'c'] 'd' 2 
-- ['a', 'b','d', 'c']
--
-- You may assume the number is always less or equal to the length of the list
--
insertAt :: [a] -> a -> Int -> [a]
insertAt = undefined


-- | Define a function 'sortList' 
--
-- The function sorts a list of pairs (the above-described key-value store)
-- according to the key, e.g.:
--
-- >>> sortList [(1, "University"), (3, "Dundee"), (2, "of")]
-- [(1, "University"),(2, "of"), (3, "Dundee")]
--
sortList :: [(Int, String)] -> [(Int, String)]
sortList = undefined



