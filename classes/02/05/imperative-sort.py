people = [{'name': 'John', 'age': 25}, {'name': 'Jane', 'age': 30}, {'name': 'Doe', 'age': 22}]

for i in range(len(people)):
  for j in range(i + 1, len(people)):
    if people[i]['age'] > people[j]['age']:
      people[i], people[j] = people[j], people[i]

print(people)

