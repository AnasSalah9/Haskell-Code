module Functions where
import Test.QuickCheck
import Test.HUnit.Base
import Control.Parallel
import Data.Time.Clock
--import Prelude hiding (max,min)

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib(n-1) + fib(n-2)

mkList ::Int -> [Int]
mkList n = [1..n-1]

relprime :: Int -> Int -> Bool
relprime x y = gcd x y == 1

euler ::Int -> Int
euler n = length(filter(relprime n) (mkList n))

sumEuler :: Int -> Int
sumEuler = sum.(map euler).mkList

sumFibEuler :: Int -> Int -> Int
sumFibEuler a b = fib a + sumEuler b












