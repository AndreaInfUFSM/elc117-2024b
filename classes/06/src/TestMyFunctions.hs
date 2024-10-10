module TestMyFunctions where


import MyFunctions
import Test.HUnit

  
testCases :: Test
testCases =
  TestList
    [ TestCase $ assertEqual "Test 1 for isFever" False (isFever 37),
      TestCase $ assertEqual "Test 2 for isFever" True (isFever 39),
      TestCase $ assertEqual "Test 1 for checkFever" [39] (checkFever [37,39]),
      TestCase $ assertEqual "Test 2 for checkFever" [] (checkFever []),
      TestCase $ assertEqual "Test 1 for checkFever'" [39] (checkFever' [37,39]),
      TestCase $ assertEqual "Test 2 for checkFever'" [] (checkFever' []),
      TestCase $ assertEqual "Test 1 for itemize" ["<li>Fulano</li>","<li>Beltrano</li>"] (itemize ["Fulano","Beltrano"] ),      
      TestCase $ assertEqual "Test 2 for itemize" [] (itemize []), 
      TestCase $ assertEqual "Test 1 for bigCircles" [5.0,6.0] (bigCircles 16 [2,5,6] ),
      TestCase $ assertEqual "Test 1 for bigCircles" [2.0,5.0,6.0] (bigCircles pi [2,5,6] ),
      TestCase $ assertEqual "Test 2 for bigCircles" [] (bigCircles 2 []),
      TestCase $ assertEqual "Test 1 for quarentine" [("Beltrano",39.0)] (quarentine [("Fulano", 37),("Beltrano", 39)]),
      TestCase $ assertEqual "Test 2 for quarentine" [] (quarentine []),
      TestCase $ assertEqual "Test 1 for agesIn" [37,22,73] (agesIn [1986,2001,1950] 2023 ),
      TestCase $ assertEqual "Test 2 for agesIn" [] (agesIn [] 2023),      
      TestCase $ assertEqual "Test 1 for superNames" ["Super Andrea","Beltrano"] (superNames ["Andrea","Beltrano"] ),
      TestCase $ assertEqual "Test 2 for superNames" [] (superNames []), 
      TestCase $ assertEqual "Test 1 for onlyShorts" ["you","are"] (onlyShorts ["you","are","awesome"] ),
      TestCase $ assertEqual "Test 2 for onlyShorts" [] (onlyShorts [])
    ]

  
main :: IO ()
main = do
  putStrLn "Running tests..."
  runTestTT testCases
  return ()
