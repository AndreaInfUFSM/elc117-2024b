module Main where

-- import MyFunctions
import MyFunctions1
import MyFunctions2
import Test.HUnit

-- ghc -package HUnit TestMyFunction.hs
-- ./TestMyFunction
-- https://caiorss.github.io/Functional-Programming/haskell/UnitTest_Hunit.html

testSumSquares :: Test
testSumSquares = TestCase $ do
  assertEqual "Test 1 for function sumSquares" 8 (sumSquares 2 2)
  assertEqual "Test 2 for function sumSquares" 8 (sumSquares (-2) (-2))
  assertEqual "Test 3 for function sumSquares" 0 (sumSquares 0 0)

testCircleArea :: Test
testCircleArea = TestCase $ do
  assertEqual "Test 1 for function circleArea" 12.566371 (circleArea 2)
  assertEqual "Test 2 for function circleArea" 21.237165 (circleArea 2.6)

testAge :: Test
testAge = TestCase $ do
  assertEqual "Test 1 for function age" 38 (age 1982 2020)
  assertEqual "Test 2 for function age" 19 (age 2002 2021)

testIsElderly :: Test
testIsElderly = TestCase $ do
  assertEqual "Test 1 for function isElderly" True (isElderly 83)
  assertEqual "Test 2 for function isElderly" False (isElderly 31)

testHtmlItem :: Test
testHtmlItem = TestCase $ do
  assertEqual "Test 1 for function HtmlItem" "<li>abc</li>" (htmlItem "abc")
  assertEqual "Test 2 for function HtmlItem" "<li></li>" (htmlItem "")

testStartsWithA :: Test
testStartsWithA = TestCase $ do
  assertEqual "Test 1 for function startsWithA" True (startsWithA "Abracadabra")
  assertEqual "Test 2 for function startsWithA" False (startsWithA "abc")

testIsVerb :: Test
testIsVerb = TestCase $ do
  assertEqual "Test 1 for function isVerb" True (isVerb "executar")
  assertEqual "Test 2 for function isVerb" False (isVerb "linguagem")

testIsVowel :: Test
testIsVowel = TestCase $ do
  assertEqual "Test 1 for function isVowel" True (isVowel 'a')
  assertEqual "Test 2 for function isVowel" False (isVowel 'r')

testHasEqHeads :: Test
testHasEqHeads = TestCase $ do
  assertEqual "Test 1 for function hasEqHeads" False (hasEqHeads [1, 2, 3] [4, 5, 6])
  assertEqual "Test 2 for function hasEqHeads" True (hasEqHeads [1, 2, 3] [1, 5, 6])

testIsVowel2 :: Test
testIsVowel2 = TestCase $ do
  assertEqual "Test 1 for function isVowel2" True (isVowel2 'a')
  assertEqual "Test 2 for function isVowel2" False (isVowel2 'r')

testCases1 :: Test
testCases1 =
  TestList
    [ testSumSquares,
      testCircleArea,
      testAge,
      testIsElderly,
      testHtmlItem,
      testStartsWithA,
      testIsVerb,
      testIsVowel,
      testHasEqHeads,
      testIsVowel2
    ]

testItemize :: Test
testItemize = TestCase $ do
  assertEqual "Test 1 for function itemize" ["<li>Haskell</li>","<li>Lisp</li>"] (itemize ["Haskell", "Lisp"])
  assertEqual "Test 2 for function itemize" [] (itemize [])

testOnlyVowels :: Test
testOnlyVowels = TestCase $ do
  assertEqual "Test 1 for function onlyVowels" "aaaaa" (onlyVowels "abracadabra")
  assertEqual "Test 2 for function onlyVowels" "" (onlyVowels "")

testOnlyElderly :: Test
testOnlyElderly = TestCase $ do
  assertEqual "Test 1 for function onlyElderly" [83] (onlyElderly [12, 21, 83])
  assertEqual "Test 2 for function onlyElderly" [] (onlyElderly [10,21])

testOnlyLongWords :: Test
testOnlyLongWords = TestCase $ do
  assertEqual "Test 1 for function onlyLongWords" ["abracadabra"] (onlyLongWords ["abracadabra", "Haskell"])
  assertEqual "Test 2 for function onlyLongWords" [] (onlyLongWords ["Haskell", "Lisp"])

testOnlyEven :: Test
testOnlyEven = TestCase $ do
  assertEqual "Test 1 for function onlyEven" [2,4] (onlyEven [1,2,3,4])
  assertEqual "Test 2 for function onlyEven" [] (onlyEven [])  

testOnlyBetween60and80 :: Test
testOnlyBetween60and80 = TestCase $ do
  assertEqual "Test 1 for function onlyBetween60and80" [75] (onlyBetween60and80 [10,50,75,83])
  assertEqual "Test 2 for function onlyBetween60and80" [] (onlyBetween60and80 []) 
  
testCountSpaces :: Test
testCountSpaces = TestCase $ do
  assertEqual "Test 1 for function countSpaces" 4 (countSpaces "a bra ca da bra")
  assertEqual "Test 2 for function countSpaces" 0 (countSpaces "teste")  

testCalcAreas :: Test
testCalcAreas = TestCase $ do
  assertEqual "Test 1 for function calcAreas" [3.1415927,12.566371,28.274334] (calcAreas [1,2,3])
  assertEqual "Test 2 for function calcAreas" [] (calcAreas [])  
  
testCases2 :: Test
testCases2 =
  TestList
    [ testItemize,
      testOnlyVowels,
      testOnlyElderly,
      testOnlyLongWords,
      testOnlyEven,
      testOnlyBetween60and80,
      testCountSpaces,
      testCalcAreas
    ]



  
main :: IO ()
main = do
  putStrLn "Running tests..."
  runTestTT testCases1
  runTestTT testCases2
  return ()