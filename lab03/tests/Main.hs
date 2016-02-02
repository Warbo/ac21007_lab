module Main where

import Control.Monad          (when)    
import Data.List as D         (sort, partition, subsequences)
import System.Exit            (exitFailure)
import Test.QuickCheck (
      quickCheckWithResult
    , Testable
    , Args
    , stdArgs
--    , choose
--    , Gen
--    , elements
    , maxSuccess
    )

import Test.QuickCheck.Test   (isSuccess)
--import Test.QuickCheck.Arbitrary (
--      arbitrary
--    , Gen
--    )

import Lab3 as L3 (
      partition
    , myConcat
    , myMinimum
    , subsequences
    , Matrix
    , transposeMatrix
    , multiplyMatrix
    )

--(
--      partition
--)


-- | Insert one random dictionary entry with key k
--
--insertOne :: Int -> [(Int, String)] -> Gen [(Int, String)]
--insertOne k lst = do
--        pos <- choose (0, length lst - 1)
--        str <- arbitrary
--        return $ insert lst pos (k, str)
--    where
        --insert :: [(Int, String)] -> Int -> (Int, String) -> [(Int, String)]
--        insert lst' pos val = (take pos lst') ++ [val] ++ (drop pos lst')

-- Test matching case
--
--prop_search :: [(Int, String)] -> Gen Bool
--prop_search [] = do
--        k <- arbitrary
--        return $ search [] k == []
--prop_search dict = do
        -- prepare existing key
--        k <- fmap fst $ elements dict

        --prepare multiple key
--        k' <- fmap fst $ elements dict
--        dictMult <- injectRepeating k' dict

        -- prepare nonexisting key
--        let k'' = foldr1 max (fmap fst dict) + 1
--
--        return $ 
--            (search dict k) == (mySearch dict k) &&
--            (search dictMult k' == mySearch dictMult k') &&
--            (search dict k'' == []) &&
--            True
--    where 
--        mySearch ds k  = map snd $  filter (((==) k) . fst) ds


--prop_insertAt :: [Char] -> Char -> Gen Bool
--prop_insertAt lst ch = do
--    pos <- choose (0, length lst)
--    return $ myAt lst ch pos == insertAt lst ch pos

--    where
--        myAt xs x pos = 
--            let (y, z) = splitAt pos xs in concat [y, [x], z]


-- ************************************************

prop_partition :: [Int] -> Bool
prop_partition xs = L3.partition f xs == D.partition f xs
    where
        f = (\x -> x `mod` 3 == 0)  

prop_myconcat :: [[Int]] -> Bool
prop_myconcat xs = myConcat xs == concat xs

prop_myminimum :: Integer -> [Integer] -> Bool
prop_myminimum x xs = let y = (x:xs) in myMinimum y == minimum y

prop_mysubs :: Char -> String -> Bool
prop_mysubs y ys = let xs = take 5 $ y : ys in (sort . L3.subsequences) xs == (sort . tail . D.subsequences ) xs

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


-- 3x2 test matrix
prop_transpose :: 
    Integer -> Integer -> Integer
    -> Integer -> Integer -> Integer
    -> Bool
prop_transpose a b c d e f = transposeMatrix ms == transposeMatrix' ms
    where
        ms = [[a, b, c], [d, e, f]]

transposeMatrix' :: Matrix -> Matrix
transposeMatrix' ms = fst $ recon ([], ms)
    where 
        recon (t, []) = (t, [])
        recon (t, m)  = let (tc, mcs) = extract m in recon (t ++ [tc], mcs)
        extract ms' = foldr f ([], []) ms'
        f []     _         = error "unreachable"
        f (c:[]) (mc, mcs) = (c:mc, mcs)
        f (c:cs) (mc, mcs) = (c:mc, cs:mcs)


prop_multiply ::
    Integer -> Integer -> Integer
    -> Integer -> Integer -> Integer
    -> Bool
prop_multiply a b c d e f = multiplyMatrix ms ns == multiplyMatrix' ms ns
    where
        ms = [[a, b, c], [d, e, f]]
        ns = [[a, d], [c, f], [e, b]]
    
multiplyMatrix' :: Matrix -> Matrix -> Matrix
multiplyMatrix' ms ns = mxMx ms ns
    where
        vecVec xs ys = sum $ zipWith (*) xs ys
        mxVec ms' v = map (vecVec v) ms'
        mxMx mx nx = map (mxVec (transposeMatrix' mx)) (nx)

    


-- | Run all the properties
main :: IO ()
main = do
    putStrLn "\npartition:"
    quickCheckFail prop_partition
    putStrLn "\nmyConcat:"
    quickCheckFail prop_myconcat
    putStrLn "\nmyMinimum:"
    quickCheckFail prop_myminimum
    putStrLn "\nsubsequences:"
    quickCheckFail prop_mysubs

    putStrLn "\ntransposeMatrix:"
    quickCheckFail prop_transpose

    putStrLn "\nmultiplyMatrix:"
    quickCheckFail prop_multiply



