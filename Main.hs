module Main where
import Functions
import Control.Parallel
import Control.Concurrent
import Control.Concurrent.MVar 
import Data.Time.Clock


parSumFibEuler :: Int -> Int -> Int
parSumFibEuler a b
   = f `par` (e `pseq` (f + e))     --f `par`(f + e)  the resolved problem
      where
      f = fib a
      e = sumEuler b

r1 :: Int
r1 = parSumFibEuler 38 5300

main :: IO()
main = do
         t0 <- getCurrentTime
         pseq r1 (return ())
         t1 <- getCurrentTime
         putStrLn("sum: " ++ show r1)
         putStrLn("time: " ++ show (diffUTCTime t1 t0))


--------------------------------------------------------------------------------------------


--mapFib :: [Int]
--mapFib = map fib [37, 38, 39, 40]

--mapEuler :: [Int]
--mapEuler = map sumEuler [7600, 7600]

--forceList :: [a] -> ()                    -- to solve the  weak head normal form WHNF
--forceList [] = ()
--forceList (x:xs) = x `pseq` forceList xs

--parMapFibEuler :: Int
--parMapFibEuler = forceList mapFib `par`                                        -- WHNF
--                  (forceList mapEuler `pseq` (sum mapFib +sum mapEuler))       -- WHNF as pseq evaluates its 1st arg as WHNF


--main :: IO()
--main = do
--         t0 <- getCurrentTime
--         pseq parMapFibEuler (return ())
--         t1 <- getCurrentTime
--         putStrLn("sum: " ++ show parMapFibEuler)
--         putStrLn("time: " ++ show (diffUTCTime t1 t0))

-------------------------------------------------------------------------------------------------

--module Functions where
--import Test.QuickCheck
--import Test.HUnit.Base
--import Control.Parallel
--import Data.Time.Clock
--import Prelude hiding (max,min)

--fib :: Int -> Int
--fib 0 = 0
--fib 1 = 1
--fib n = fib(n-1) + fib(n-2)

--mkList ::Int -> [Int]
--mkList n = [1..n-1]

--relprime :: Int -> Int -> Bool
--relprime x y = gcd x y == 1

--euler ::Int -> Int
--euler n = length(filter(relprime n) (mkList n))

--sumEuler :: Int -> Int
--sumEuler = sum.(map euler).mkList

--sumFibEuler :: Int -> Int -> Int
--sumFibEuler a b = fib a + sumEuler b


