people = [{"John", 25}, {"Jane", 30}, {"Doe", 22}]

sorted_people = Enum.sort_by(people, fn {_, age} -> age end)

IO.inspect(sorted_people)

