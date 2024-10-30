students = [("Alice",1001,8.55),("Bob", 1002,7.8),("Charlie", 1003,9.2)]

average = sum grades / fromIntegral (length grades)
  where
    grades = [grade | (_,_,grade) <- students]
