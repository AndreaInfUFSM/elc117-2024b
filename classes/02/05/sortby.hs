import Data.List (sortBy)

people :: [(String, Int)]
people = [("John", 25), ("Jane", 30), ("Doe", 22)]

sortedPeople :: [(String, Int)]
sortedPeople = sortBy (\(_, age1) (_, age2) -> compare age1 age2) people

main :: IO ()
main = print sortedPeople

