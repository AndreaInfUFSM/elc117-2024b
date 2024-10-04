module TestMyFunctions where


import MyFunctions
import Test.HUnit

      
testCases1 :: [Test]
testCases1 = 
  [ TestCase $ assertEqual name result (f ns) 
  | (name, f, ns, result) <- functionsToTest
  ]
  where 
    functionsToTest =
      [ ("add10ToAll", add10ToAll, [1,2,3], [11,12,13]),
        ("applyExpr", applyExpr, [1,2,3], [5,8,11]),
        ("applyExpr'", applyExpr', [1,2,3], [5,8,11]),
        ("selectGt5", selectGt5, [1,2,3], []),
        ("selectExpr", selectExpr, [1,2,3], [])
      ]             
    
testCases2 :: [Test]
testCases2 = 
  [ TestCase $ assertEqual name result (f n ns) 
  | (name, f, n, ns, result) <- functionsToTest
  ]
  where 
    functionsToTest =
      [ ("multN", multN, 3, [1,2,3], [3,6,9]),
        ("multN", multN, 3, [], []),
        ("multN", multN, 4, [1,2,3], [4,8,12]),
        ("multN'", multN', 3, [1,2,3], [3,6,9]),
        ("multN'", multN', 3, [], []),
        ("multN'", multN', 4, [1,2,3], [4,8,12])
      ]

testCases3 :: [Test]
testCases3 =
  [ TestCase $ assertEqual "addSuffix" ["fulano@inf.ufsm.br","beltrano@inf.ufsm.br"] (addSuffix "@inf.ufsm.br" ["fulano","beltrano"]),
    TestCase $ assertEqual "addSuffix" [] (addSuffix "@inf.ufsm.br" []),
    TestCase $ assertEqual "sumOdds" 4 (sumOdds [1,2,3]),
    TestCase $ assertEqual "sumOdds'" 4 (sumOdds' [1,2,3]),
    TestCase $ assertEqual "countShorts" 2 (countShorts ["you","are","awesome"]),
    TestCase $ assertEqual "trSpaces" "nome-sobrenome" (trSpaces "nome sobrenome"), 
    TestCase $ assertEqual "trSpaces" "nome" (trSpaces "nome"), 
    TestCase $ assertEqual "selectSnd" [2,4] (selectSnd [(1,2),(3,4)]), 
    TestCase $ assertEqual "selectSnd" [1,4] (selectSnd [(0,1),(3,4)]),     
    TestCase $ assertEqual "dotProd" 8 (dotProd [1,1,1,1] [2,2,2,2]),
    TestCase $ assertBool "calcExpr" (withinTolerance 1e-6 10.125 (head (calcExpr [1.0, 1.5, 2.5, 3.5, 4.5]))) 
  ]

withinTolerance :: Float -> Float -> Float -> Bool
withinTolerance tolerance expected actual =
    abs (expected - actual) <= tolerance

  
main :: IO ()
main = do
  runTestTT (TestList testCases1)
  runTestTT (TestList testCases2)  
  runTestTT (TestList testCases3)  
  return ()

