-- Module      :  Main
-- Author      :  Frantisek Farka <ffarka@dundee.ac.uk>
--
-- |
--
-----------------------------------------------------------------------------

module Main where


-- | Simple function to create a hello message.
hello :: String -> String
hello s = "Goodbye " ++ s ++ "!"

-- | Entry point of a program
main :: IO ()
main = putStrLn (hello "World")



-- Implement your own boolean functions:


-- | myAnd returns True only if both of the inputs are True.
--
-- myAnd :: Bool -> Bool -> Bool,
myAnd True True = True
myAnd x    y    = False

-- | myOr returns False only if both of the inputs are False.
--
-- myOr :: Bool -> Bool -> Bool

myOr False False = False
myOr x     y     = True

-- | myImply x y should return False only if x is True and y is False, for the
--   other cases it returns True
--
-- myImply :: Bool -> Bool -> Bool

myImply True False = False
myImply x    y     = True

-- | myXor is called Exclusive disjunction (exclusive or), is a logical operation
--   that outputs True whenever both inputs differ (one is True, the other is False)
--
-- myXor :: Bool -> Bool -> Bool.

myXor True True   = False
myXor True False  = True
myXor False True  = True
myXor False False = False

-- | Define a function that converts boolean value to its coresponding text description,
--   e. g. 
--
--       boolToString True ==> "true"
--
-- boolToString :: Bool -> String

boolToString True  = "true"
boolToString False = "false"
