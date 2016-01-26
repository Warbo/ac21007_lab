module Main where

import Control.Monad          (when)    
import Data.List              (sortBy)
import System.Exit            (exitFailure)
import Test.QuickCheck (
      quickCheckWithResult
    , Testable
    , Args
    , stdArgs
    , choose
    , Gen
    , elements
    , maxSuccess
    )
import Test.QuickCheck.Test   (isSuccess)
import Test.QuickCheck.Arbitrary (
      arbitrary
--    , Gen
    )


import Lab2 (
      deletion
    , search
    , append
    , revprefix
    , forAll
    , exists
    , insertAt
    , sortList
    )


-- | Prop deletion
--
prop_deletion :: [Char] -> Char -> Bool
prop_deletion xs x = not (x `elem` (deletion xs x))

-- | Insert one random dictionary entry with key k
--
insertOne :: Int -> [(Int, String)] -> Gen [(Int, String)]
insertOne k lst = do
        pos <- choose (0, length lst - 1)
        str <- arbitrary
        return $ insert lst pos (k, str)
    where
        --insert :: [(Int, String)] -> Int -> (Int, String) -> [(Int, String)]
        insert lst' pos val = (take pos lst') ++ [val] ++ (drop pos lst')

-- | Inserts 4 random  entries with a given key
--
injectRepeating :: Int -> [(Int, String)] -> Gen [(Int, String)]
injectRepeating k lst  = do
        f lst >>= f >>= f >>= f >>= f
    where 
        f = insertOne k

-- Test matching case
--
prop_search :: [(Int, String)] -> Gen Bool
prop_search [] = do
        k <- arbitrary
        return $ search [] k == []
prop_search dict = do
        -- prepare existing key
        k <- fmap fst $ elements dict

        --prepare multiple key
        k' <- fmap fst $ elements dict
        dictMult <- injectRepeating k' dict

        -- prepare nonexisting key
        let k'' = foldr1 max (fmap fst dict) + 1

        return $ 
            (search dict k) == (mySearch dict k) &&
            (search dictMult k' == mySearch dictMult k') &&
            (search dict k'' == []) &&
            True
    where 
        mySearch ds k  = map snd $  filter (((==) k) . fst) ds


-- | Prop append
--
prop_append :: String -> String -> Bool
prop_append a b = append a b == a ++ b


-- | Prop revprefix
--
prop_revprefix :: String -> Char -> Bool
prop_revprefix a b = (reverse (b:a)) == (revprefix a b)

-- | Prop forAll
--
prop_forAll :: [Int] -> Bool
prop_forAll lst = (foldr ((&&) . f) True lst) == forAll f lst
    where
        --f = even
        f = \x -> x `mod` 3 == 0

-- | Prop forAll
--
prop_exists :: [Int] -> Bool
prop_exists lst = (foldr ((||) . f) False lst) == exists f lst
    where
        --f = even
        f = \x -> x `mod` 3 == 0

-- | Prop insertAt
--
prop_insertAt :: [Char] -> Char -> Gen Bool
prop_insertAt lst ch = do
    pos <- choose (0, length lst)
    return $ myAt lst ch pos == insertAt lst ch pos

    where
        myAt xs x pos = 
            let (y, z) = splitAt pos xs in concat [y, [x], z]

-- | Prop sortList
--
prop_sortList :: [(Int, String)] -> Bool
prop_sortList lst = (my lst) == (sortList lst)
    where
        my lst' = sortBy f lst'
        f x y = fst x `compare` fst y


-- | Helper to integrate QuicCheck with exitcode-stdio
quickCheckFailWith :: Testable prop => Args -> prop -> IO ()
quickCheckFailWith args p = do
        success <- fmap isSuccess $ quickCheckWithResult args p 
        when (not success) $ exitFailure -- exit if the result is a failure

-- | Helper, ditto
quickCheckFail :: Testable prop => prop -> IO ()
quickCheckFail p = quickCheckFailWith ourArgs p

ourArgs :: Args
ourArgs = stdArgs {
      maxSuccess = 500
    }

-- | Run all the properties
main :: IO ()
main = do
    putStrLn "\ndeletion:"
    quickCheckFail prop_deletion
    putStrLn "\nsearch:"
    quickCheckFail prop_search
    putStrLn "\nappend:"
    quickCheckFail prop_append
    putStrLn "\nrevprefix:"
    quickCheckFail prop_revprefix
    putStrLn "\nexists:"
    quickCheckFail prop_exists
    putStrLn "\ninsertAt:"
    quickCheckFail prop_insertAt
    putStrLn "\nsortList:"
    quickCheckFail prop_sortList


